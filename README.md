# gitsigns.nvim

Fork of [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim).

Patches:

- fix for `cygwin` based `git` (`MSYS2`, `mingw`);
- fix for repositories encrypted with `git-crypt`;
- add `git_cmd` config option;

### How to merge

```sh
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
```
