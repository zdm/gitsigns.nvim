#!/usr/bin/env bash

set -e

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
git merge --no-edit update-readme feat-msys2 feat-git-crypt feat-git-option

git push --all
