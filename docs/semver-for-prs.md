# Release(SemVer) Guide: Pull Request Titles into Main

## Overview

The **pull-request** GitHub Action enforces semantic pull request titles to maintain consistency in commit messages. It ensures that pull requests follow conventional commit standards.

## Configuration

This workflow is triggered on various pull request events:

- **labeled**
- **opened**
- **synchronize**
- **reopened**
- **ready_for_review**
- **edited**

### Workflow File

Create a `.github/workflows/release.yml` file in your repository with the following content:

```yaml
name: Release

on:
  push:
    branches:
      - main
  workflow_dispatch: {}

permissions:
  contents: read 

jobs:
  release: 
    name: Release 
    runs-on: ubuntu-latest 
    permissions: 
      contents: write 
      issues: write 
      pull-requests: write 
    steps: 
      - name: Checkout 
        uses: actions/checkout@v4 
        with:
          fetch-depth: 0 
      - name: Setup Node 
        uses: actions/setup-node@v4 
        with: 
          node-version: "lts/*"
      - name: Release 
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: npx semantic-release --branches main
```

## How It Works

- When a pull request is created, labeled, synchronized, or edited, this workflow runs.
- The action checks the pull request title to ensure it follows the Conventional Commits specification.
- Titles must follow the format: `type(scope): description`, where:
  - `type` must be one of the allowed values (`feat`, `fix`, `chore`, `refactor`, `docs`, `test`, `ci`, `revert`).
  - `scope` is required (e.g., `feat(api): add new endpoint`).
  - The description should be meaningful and in lowercase.

## Example Pull Request Titles

✅ Valid:

- `feat(api): add user authentication`
- `fix(auth): resolve token expiration issue`
- `docs(readme): update installation guide`

❌ Invalid:

- `feature: add user authentication` (wrong type)
- `fix: broken login` (missing scope)
- `docs: Updated README` (uppercase in description)

## Setting Up a Pull Request

1. Create a new branch:

   ```sh
   git checkout -b feature/my-new-feature
   ```

2. Make changes and commit using a semantic message:

   ```sh
   git commit -m "feat(api): add new endpoint for users"
   ```

3. Push changes and create a pull request:

   ```sh
   git push origin feature/my-new-feature
   ```

4. Ensure the pull request title follows the required format.

## Troubleshooting

- If the workflow fails, check the **Actions** tab in your repository.
- Verify that the pull request title follows the correct format.
- Ensure the workflow file is correctly placed in `.github/workflows/`.

## Conclusion

By enforcing structured pull request titles, this action helps maintain a clean and readable commit history. Integrate this workflow to ensure consistency in your project's development process.
