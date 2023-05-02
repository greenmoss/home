#!/usr/bin/env sh
set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle

# pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install or update all vim plugins
cd ~/.vim/bundle
for repo in \
  "https://github.com/ciaranm/detectindent" \
  "https://github.com/PProvost/vim-ps1" \
  "https://github.com/preservim/nerdtree" \

do
  mydir=$(basename $repo)
  if [ -d "$mydir" ]; then
    cd "$mydir"
    git pull origin master
    cd -
  else
    git clone "$repo"
  fi
done
