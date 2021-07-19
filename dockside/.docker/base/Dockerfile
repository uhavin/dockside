FROM ubuntu:latest

ARG gid=1000
ARG git_core_excludesfile=~/.gitignore
ARG git_user_email=you@example.com
ARG git_user_name=you
ARG host_dotfiles_dir
ARG python_version=3.9.6
ARG timezone=Eurpe/Amsterdam
ARG uid=1000
ARG user=developer

# python via pyenv
ENV LANG="C.UTF-8" \
    LC_ALL="C.UTF-8" \
    PATH=/home/$user/.pyenv/bin:/home/$user/.pyenv/shims:$PATH \
    PYENV_SHELL="zsh" \
    TIMEZONE=$timezone

RUN export DEBIAN_FRONTEND=noninteractive && \
    yes | unminimize && \
    apt-get update && \
    apt-get install -y -q --no-install-recommends \
        bash-completion \
        build-essential \
        ca-certificates \
        curl \
        git \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        llvm \
        man-db \
        python-openssl \
        sudo \
        tk-dev \
        tmux \
        vim \
        wget \
        xz-utils \
        zlib1g-dev \
        zsh && \
    rm -rf /var/lib/apt/lists/*

# User creaton, configs
RUN groupadd -g $gid niels && \
    useradd -rm -d /home/$user -s /bin/zsh -g $user -G sudo -u $uid $user && \
    echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $user
WORKDIR /home/$user

# Git basic setup
RUN git config --global user.name "$git_user_name" && \
    git config --global user.email "$git_user_email" && \
    git config --global core.excludesfile "$git_core_excludesfile"

# PYENV and nvim venv
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash && \
    pyenv install $python_version && \
    pyenv virtualenv $python_version nvim && \
    $HOME/.pyenv/versions/nvim/bin/python -m pip install pynvim

RUN sudo chown -R $user:$user /home/$user

# STARSHIP
RUN sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes && \
    echo 'eval "$(starship init zsh)"' >> /home/$user/.zshrc 

# NEOVIM
RUN curl -Lo nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && \
    chmod u+x nvim.appimage && \
    ./nvim.appimage --appimage-extract && \
    echo "alias nvim=~/squashfs-root/usr/bin/nvim" >> ~/.zshrc && \
    sh -c 'curl -fLo /home/$user/.local/share/nvim/site/autoload/plug.vim \
       --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

COPY ./dotfiles/nvim/plugins.vim /home/$user/.config/nvim/plugins.vim
RUN ~/squashfs-root/usr/bin/nvim -u ~/.config/nvim/plugins.vim --headless +PlugInstall +qall

CMD tmux

