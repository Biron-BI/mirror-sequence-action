## Mirror Sequence Action

A github action to copy selected files from the repository triggering the action to another.

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
      - uses: "actions/checkout@v2"
      - name: Copy specified files to distant repo
        id: mirror
        uses: Biron-BI/mirror-sequence-action@1.0
        with:
          ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
          target_files: 'src,foo,bar.txt'
          target_repo_url: ${{ secrets.DEST_REPO }}
```
