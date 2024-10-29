#!/bin/sh
ls .husky/lfs-hooks >> /dev/null 2>&1 || (
  rm -rf .git/hooks
  git config --unset core.hooksPath
  git lfs install
  [ -d ".git/hooks" ] && mv .git/hooks .husky/lfs-hooks
  rm -rf node_modules/husky
  npm install
  apt-get update
  apt-get install git-lfs
  git lfs pull
)
