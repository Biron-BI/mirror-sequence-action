## Mirror Sequence Action

A github action to copy selected files from the repository triggering the action to an other one.

> The input `ssh_private_key` must have access to both repositories

Example `.github/workflows/main.yml` :

```yaml
name: Mirror Sequence
on: 
  push:
    branches:
      - master
jobs:
  mirror_sequence:
    runs-on: ubuntu-latest
    name: Copy specified files to distant repo
    steps:
      - name: Copy specified files to distant repo
        id: mirror
        uses: Biron-BI/mirror-sequence-action@1.0
        with:
          ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
          target_files: 'src,README.md'
          target_repo_url: ${{ secrets.TARGET_REPO_URL }}
```
