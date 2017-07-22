#!/usr/bin/env sh
set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle

# pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# detectindent
cd ~/.vim/bundle
git clone https://github.com/ciaranm/detectindent
