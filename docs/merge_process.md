
### For Feature Branches (from `develop`):

1. **Create the Feature Branch**:
   - Create the feature branch from the latest `develop` branch:
     ```bash
     git checkout develop
     git pull origin develop
     git checkout -b feature/your-feature
     ```

2. **Work on the Feature**:
   - Commit changes to your feature branch.
   - Regularly pull updates from `develop` to keep your feature branch in sync:
     ```bash
     git pull origin develop
     ```

3. **Push the Feature Branch**:
   - Push your feature branch to the remote repository:
     ```bash
     git push origin feature/your-feature
     ```

4. **Create a Pull Request**:
   - Open a pull request (PR) from `feature/your-feature` into `develop`.
   - Add reviewers and ensure all CI checks pass.

5. **Merge the Pull Request**:
   - Once the PR is approved and all checks pass, merge it into `develop` using the GitHub interface.

6. **Delete the Feature Branch**:
   - After merging, delete the feature branch both locally and remotely:
     ```bash
     # Delete the branch locally
     git branch -d feature/your-feature

     # Delete the branch remotely
     git push origin --delete feature/your-feature
     ```