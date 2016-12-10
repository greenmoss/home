#!/usr/bin/env sh
set -e
cd ~/.vim/bundle
for REPO in https://github.com/ciaranm/detectindent
do
  git clone $REPO
done
