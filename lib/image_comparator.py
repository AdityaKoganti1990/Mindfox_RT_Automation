import hashlib
import os
from PIL import Image

IMAGE_EXTENSIONS = {".png", ".jpg", ".jpeg", ".bmp", ".tif", ".tiff", ".gif", ".webp"}

class ImageComparator:
    @staticmethod
    def compare_images(image_path1, image_path2):
        """
        Compare two images pixel by pixel.
        Returns True if images are identical, False otherwise.
        """
        img1 = Image.open(image_path1)
        img2 = Image.open(image_path2)

        if img1.size != img2.size:
            return False

        pixels1 = img1.load()
        pixels2 = img2.load()

        width, height = img1.size
        for x in range(width):
            for y in range(height):
                if pixels1[x, y] != pixels2[x, y]:
                    return False
        return True

    @staticmethod
    def image_match_percentage(image_path1, image_path2):
        """
        Return image match percentage (0.0-100.0) by pixel comparison.
        If image sizes differ, returns 0.0.
        """
        if not os.path.exists(image_path1) or not os.path.exists(image_path2):
            return 0.0

        with Image.open(image_path1) as img1, Image.open(image_path2) as img2:
            if img1.size != img2.size:
                return 0.0

            img1 = img1.convert("RGBA")
            img2 = img2.convert("RGBA")

            total_pixels = img1.width * img1.height
            if total_pixels == 0:
                return 100.0

            matching_pixels = sum(1 for p1, p2 in zip(img1.getdata(), img2.getdata()) if p1 == p2)
            return (matching_pixels / total_pixels) * 100.0

    @staticmethod
    def compare_binary_files(file_path1, file_path2):
        """
        Compare two files byte-by-byte using SHA256 digest.
        Returns True if files are identical, False otherwise.
        """
        if not os.path.exists(file_path1) or not os.path.exists(file_path2):
            return False

        hash1 = hashlib.sha256()
        hash2 = hashlib.sha256()

        with open(file_path1, "rb") as f1:
            for chunk in iter(lambda: f1.read(1024 * 1024), b""):
                hash1.update(chunk)

        with open(file_path2, "rb") as f2:
            for chunk in iter(lambda: f2.read(1024 * 1024), b""):
                hash2.update(chunk)

        return hash1.digest() == hash2.digest()

    @staticmethod
    def binary_match_percentage(file_path1, file_path2, chunk_size=1024 * 1024):
        """
        Return byte-level match percentage (0.0-100.0) for any binary files.
        Extra bytes in the longer file are treated as mismatch.
        """
        if not os.path.exists(file_path1) or not os.path.exists(file_path2):
            return 0.0

        size1 = os.path.getsize(file_path1)
        size2 = os.path.getsize(file_path2)
        denominator = max(size1, size2)
        if denominator == 0:
            return 100.0

        matching_bytes = 0
        with open(file_path1, "rb") as f1, open(file_path2, "rb") as f2:
            while True:
                chunk1 = f1.read(chunk_size)
                chunk2 = f2.read(chunk_size)
                if not chunk1 and not chunk2:
                    break

                limit = min(len(chunk1), len(chunk2))
                if limit > 0:
                    matching_bytes += sum(
                        1 for b1, b2 in zip(chunk1[:limit], chunk2[:limit]) if b1 == b2
                    )

        return (matching_bytes / denominator) * 100.0

    @staticmethod
    def compare_files(file_path1, file_path2):
        """
        Compare two files by extension:
        - image files: pixel-by-pixel
        - all other files (including PDF): binary SHA256 comparison
        """
        _, ext1 = os.path.splitext(file_path1)
        _, ext2 = os.path.splitext(file_path2)
        ext1 = ext1.lower()
        ext2 = ext2.lower()

        if ext1 in IMAGE_EXTENSIONS and ext2 in IMAGE_EXTENSIONS:
            return ImageComparator.compare_images(file_path1, file_path2)

        return ImageComparator.compare_binary_files(file_path1, file_path2)

    @staticmethod
    def file_match_percentage(file_path1, file_path2):
        """
        Return match percentage (0.0-100.0):
        - image files: pixel-level percentage
        - all other files (including PDF): byte-level percentage
        """
        _, ext1 = os.path.splitext(file_path1)
        _, ext2 = os.path.splitext(file_path2)
        ext1 = ext1.lower()
        ext2 = ext2.lower()

        if ext1 in IMAGE_EXTENSIONS and ext2 in IMAGE_EXTENSIONS:
            return ImageComparator.image_match_percentage(file_path1, file_path2)

        return ImageComparator.binary_match_percentage(file_path1, file_path2)


def compare_images(image_path1, image_path2):
    """
    Module-level wrapper so Robot Framework can use `Compare Images` keyword.
    Returns True if images are identical, False otherwise.
    """
    return ImageComparator.compare_images(image_path1, image_path2)


def compare_files(file_path1, file_path2):
    """
    Module-level wrapper so Robot Framework can use `Compare Files` keyword.
    Supports .png/.jpg/... via image compare and .pdf/other via binary compare.
    """
    return ImageComparator.compare_files(file_path1, file_path2)


def file_match_percentage(file_path1, file_path2):
    """
    Module-level wrapper so Robot Framework can use `File Match Percentage` keyword.
    Returns match percentage between 0.0 and 100.0.
    """
    return ImageComparator.file_match_percentage(file_path1, file_path2)


def resize_image_to_target(source_path, dest_path, width=800, height=600):
    """
    Resize the image at ``source_path`` to (width x height) and save it to
    ``dest_path``. The destination directory is created if needed and any
    existing file at ``dest_path`` is overwritten.

    Used to normalize screenshots to a fixed resolution at capture time so the
    same Expected baseline can be reused across machines with different
    display resolutions or UI scales.

    Returns the absolute destination path.
    """
    if not os.path.exists(source_path):
        raise FileNotFoundError(f"Source image not found: {source_path}")

    width = int(width)
    height = int(height)
    if width <= 0 or height <= 0:
        raise ValueError(f"Invalid target size: {width}x{height}")

    dest_dir = os.path.dirname(os.path.abspath(dest_path))
    if dest_dir and not os.path.isdir(dest_dir):
        os.makedirs(dest_dir, exist_ok=True)

    resample = getattr(Image, "Resampling", Image).LANCZOS

    with Image.open(source_path) as img:
        resized = img.convert("RGBA").resize((width, height), resample)
        resized.save(dest_path)

    return os.path.abspath(dest_path)
