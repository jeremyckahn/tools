mkdir -p ~/.vim/autoload;
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

cd ~/tools/;
git submodule init;
