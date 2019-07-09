# install手順

    git clone https://github.com/vim/vim
    LDFLAGS=-export-dynamic ./configure  --enable-fail-if-missing --with-features=huge  --disable-selinux  --enable-luainterp --enable-python3interp  --enable-cscope  --enable-fontset  --enable-multibyte vi_cv_path_python3=/usr/local/python36/bin/python3.6 --prefix=/usr/local  --enable-rubyinterp
    make
    make install

.bashrcに以下を追記

    if [ -f /usr/bin/virtualenvwrapper.sh ]; then
        export WORKON_HOME=$HOME/.virtualenvs
        source /usr/bin/virtualenvwrapper.sh
    fi

ホームディレクトリ配下に~/.vim/colors/を作成する

    mkdir ~/.vim
    cd ~/.vim
    mkdir colors
    git clone https://github.com/tomasr/molokai
    cp molokai/colors/molokai.vim ~/.vim/colors/

plugin管理ソフトをinstall

    git clone https://github.com/konti-kun/vim_env.git
    ln -s vim_env/.vimrc .vimrc
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.vim/dein

