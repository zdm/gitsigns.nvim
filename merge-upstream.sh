#!/usr/bin/env bash

set -e

git fetch upstream

git switch update-readme
git merge upstream/main

git switch feat-msys2
git merge upstream/main

git switch feat-git-crypt
git merge upstream/main

git switch feat-git-option
git merge upstream/main

git switch main
git merge update-readme feat-msys2 feat-git-crypt feat-git-option

git push --all
