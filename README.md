# install手順

    git clone https://github.com/vim/vim
    LDFLAGS=-export-dynamic ./configure  --enable-fail-if-missing --with-features=huge  --disable-selinux  --enable-luainterp --enable-python3interp  --enable-cscope  --enable-fontset  --enable-multibyte vi_cv_path_python3=/usr/local/python36/bin/python3.6 --prefix=/usr/local
    make
    make install
    pip3.6 install virtualenvwrapper
    which virtualenvwrapper.sh

virtualenvwrapper.shの書き換え(pythonからpython3.6に)

.bashrcに以下を追記
    if [ -f /usr/bin/virtualenvwrapper.sh ]; then
        export WORKON_HOME=$HOME/.virtualenvs
        source /usr/bin/virtualenvwrapper.sh
    fi

