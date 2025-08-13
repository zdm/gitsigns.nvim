#!/usr/bin/env bash

set -Eeuo pipefail
trap 'echo -e "⚠  Error ($0:$LINENO): $(sed -n "${LINENO}p" "$0" 2> /dev/null | grep -oE "\S.*\S|\S" || true)" >&2; return 3 2> /dev/null || exit 3' ERR

git fetch upstream

git switch update-readme
git merge --no-edit upstream/main

git switch feat-msys2
git merge --no-edit upstream/main

git switch feat-git-crypt
git merge --no-edit upstream/main

git switch feat-git-option
git merge --no-edit upstream/main

git switch main
git reset --hard $(git rev-list --max-parents=0 HEAD)
git merge --no-edit upstream/main
git merge --no-edit update-readme feat-msys2 feat-git-crypt feat-git-option

git push --all
