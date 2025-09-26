#!/usr/bin/env bash

set -Eeuo pipefail
trap 'echo -e "⚠  Error ($0:$LINENO): $(sed -n "${LINENO}p" "$0" 2> /dev/null | grep -oE "\S.*\S|\S" || true)" >&2; return 3 2> /dev/null || exit 3' ERR

old_commit=$(git rev-parse upstream)

git fetch upstream

new_commit=$(git rev-parse upstream)

if [ "$old_commit" = "$new_commit" ]; then
  echo "No updates available"

  exit
fi

git switch update-readme
git merge --no-edit upstream/main

git switch fix-msys2
git merge --no-edit upstream/main

git switch feat-git-option
git merge --no-edit upstream/main

git switch feat-git-crypt
git merge --no-edit upstream/main

git switch main
git reset --hard $(git rev-list --max-parents=0 HEAD)
git merge --no-edit upstream/main

# git merge --no-edit update-readme fix-msys2 feat-git-option feat-git-crypt
git merge --no-edit update-readme
git merge --no-edit fix-msys2
git merge --no-edit feat-git-option
git merge --no-edit feat-git-crypt

git push --all --force
