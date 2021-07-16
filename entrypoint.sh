#!/usr/bin/env sh
set -eu

/setup-ssh.sh

SRC_FOLDER="source"
TARGET_FOLDER="target"
REFDATE=$(date '+%Y-%m-%d %H:%M:%S')

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"

git config --global user.name "Biron"
git config --global user.email "support@biron-analytics.com"

git clone "github.com:$GITHUB_REPOSITORY.git" "$SRC_FOLDER"
git clone "$INPUT_TARGET_REPO_URL" "$TARGET_FOLDER"

IFS=","
for FILE in $INPUT_TARGET_FILES
do
  echo "copying $FILE"
  mv "$SRC_FOLDER/$FILE" "$TARGET_FOLDER/$FILE"
done

cd "$TARGET_FOLDER"
git commit -am "$REFDATE"
git push