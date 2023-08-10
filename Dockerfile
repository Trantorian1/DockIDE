FROM ubuntu:22.04

# main dependencies
RUN apt-get update
RUN apt-get install -y clang wget tar git unzip curl gdb tree \
            libreadline-dev libcriterion-dev make

# installing zsh
RUN apt-get install -y zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ENV SHELL=/bin/zsh

# installing lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \
	grep -Po '"tag_name": "v\K[^"]*') && \
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
	tar xf lazygit.tar.gz lazygit && \
	install lazygit /usr/local/bin

# setting nvim as default commit editor
RUN git config --global core.editor "nvim -u /root/.config/nvim/git_init.lua"

# downloading norminette
RUN curl https://bootstrap.pypa.io/get-pip.py | python3 && \
	python3 -m pip install --upgrade pip setuptools && \
	python3 -m pip install norminette

WORKDIR /bin

# downloading neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz && \
	tar xzvf nvim-linux64.tar.gz && rm -rf nvim-linux64.tar.gz && \
	ln -s /bin/nvim-linux64/bin/nvim /bin/ && mkdir -p /root/.config/nvim/

ENV PATH $PATH:/app/nvim-linux64/bin

# copying git credentials
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR /app

CMD ["nvim"]
