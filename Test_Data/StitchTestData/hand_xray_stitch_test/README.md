# Hand X-ray stitch test phantom

A **synthetic** PA hand radiograph (1024 × 1400, 16-bit) split into 3 vertically
overlapping tiles, for testing image-stitching / long-length-imaging code.

Nothing here is patient data — the image is procedurally generated, so it is safe
to commit to a repo, attach to a bug report, or ship in a CI fixture set.

## Layout

```
full_reference.png          16-bit ground-truth composite (what a correct stitch should produce)
full_reference_preview.png  8-bit, for eyeballing
clean/tile_1..3.png         16-bit PNG, exact crops — pure translation, no distortion
misaligned/tile_1..3.png    16-bit PNG, with realistic acquisition drift
dicom/clean/tile_1..3.dcm   same pixels as DX (Digital X-Ray) objects, MONOCHROME2, 16-bit
dicom/misaligned/*.dcm
ground_truth.json           per-tile transforms and applied perturbations
```

## Geometry

| | |
|---|---|
| Tile size | 1024 × 600 |
| Step between tiles | 400 px |
| **Overlap** | **200 px (33%)** |
| Nominal starts (y) | 0, 400, 800 |
| Pixel spacing | 0.140 mm (in `ImagerPixelSpacing`) |

Tile 1 is fingertips, tile 2 is phalanges/metacarpals, tile 3 is carpals plus
distal forearm. Every overlap band contains bone edges and trabecular texture, so
feature-based and intensity-based registration both have something to work with.

## The two sets

**`clean/`** — exact crops. Stitching these should recover the reference
bit-exactly (verified: max abs error = 0). Use it as the pass/fail smoke test.

**`misaligned/`** — each tile additionally has a sub-pixel/few-pixel shift, a
small rotation, a different exposure gain, and an anode heel-effect intensity
ramp. This is the set that actually exercises registration and blending.

| tile | dx (px) | dy (px) | rotation (°) | gain | heel ramp |
|---|---|---|---|---|---|
| 1 | 0.0 | 0.0 | 0.00 | 1.000 | 0.06 |
| 2 | −6.4 | +3.1 | +0.45 | 0.930 | 0.09 |
| 3 | +4.9 | −2.2 | −0.70 | 1.080 | 0.07 |

Uncorrected gain differences will show up as visible seams — that's deliberate,
it tests your intensity blending separately from your geometric alignment.

## Ground truth

`ground_truth.json` gives each tile a 2 × 3 affine `tile_to_reference`:

```
[X_ref, Y_ref]^T = M · [u, v, 1]^T
```

where `(u, v)` are tile pixel coordinates and `(X_ref, Y_ref)` are coordinates in
`full_reference.png`. A correct stitcher should recover these matrices. Scoring
suggestion: mean corner reprojection error against `M`, plus RMSE of the composite
versus `full_reference.png` inside the overlap bands.

## DICOM notes

Tiles are `DX` (Digital X-Ray Image Storage, `1.2.840.10008.5.1.4.1.1.1.1`),
16-bit unsigned, MONOCHROME2, ordered by `InstanceNumber` / `AcquisitionNumber`
1→3 top to bottom. Clean and misaligned sets are separate series under one study.
PatientName is `SYNTHETIC^PHANTOM`.

The DX IOD has no standard slot for inter-image position, so the DICOM files carry
no positional hint — the geometry lives only in `ground_truth.json`. If your
software keys off a specific vendor tag (`ImagePositionPatient`, a private
stitching group, `TableHeight`, an offset in `AcquisitionContextSequence`), say
which and I can populate it.
