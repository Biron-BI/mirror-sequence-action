#!/usr/bin/env sh
set -eu

/setup-ssh.sh

TARGET_FOLDER="target"
REFDATE=$(date '+%Y-%m-%d %H:%M:%S')

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"

git config --global user.name "Biron"
git config --global user.email "support@biron-analytics.com"

git clone --depth 1 "$INPUT_TARGET_REPO_URL" "$TARGET_FOLDER"

IFS=","
for FILE in $INPUT_TARGET_FILES
do
  echo "copying $FILE"
  pwd
  ls
  cp -a "$INPUT_SRC_FOLDER/$FILE" "$TARGET_FOLDER/"
done

cd "$TARGET_FOLDER"
git add .
git commit -m "$REFDATE"
git push