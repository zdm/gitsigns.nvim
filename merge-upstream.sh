#!/usr/bin/env bash

git fetch upstream || exit 1

git switch update-readme || exit 1
git merge --no-edit upstream/main || exit 1

git switch feat-msys2 || exit 1
git merge --no-edit upstream/main || exit 1

git switch feat-git-crypt || exit 1
git merge --no-edit upstream/main || exit 1

git switch feat-git-option || exit 1
git merge --no-edit upstream/main || exit 1

git switch main || exit 1
git merge --no-edit update-readme feat-msys2 feat-git-crypt feat-git-option || exit 1

git push --all || exit 1
