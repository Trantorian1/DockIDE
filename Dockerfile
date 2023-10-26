FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependencies for glvnd and X11.
RUN apt-get update \
	&& apt-get install -y \
		# opengl libraries
		mesa-utils \
		libgl1-mesa-dri \
		libgl1-mesa-glx \
		libglu1-mesa \
		# x11 libraries
		libglvnd0 \
		libgl1 \
		libglx0 \
		libegl1 \
		libxext6 \
		libx11-6 \
		# dev libraries
		clang \
		wget \
		tar \
		git \
		unzip \
		curl \
		gdb \
		tree \
		libreadline-dev \
		libcriterion-dev \
		make \
		zsh \
		# neovide
		fontconfig \
		libxcursor1 \
		libxrandr2 \
		libxi6 \
		libxkbcommon0 \
		libxkbcommon-x11-0 \
		libx11-xcb1 \
	&& rm -rf /var/lib/apt/lists/*

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

WORKDIR /usr/local/bin

# installing zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ENV SHELL=/bin/zsh

# installing lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \
	grep -Po '"tag_name": "v\K[^"]*') \
	&& curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
	&& tar xf lazygit.tar.gz lazygit

# downloading norminette
RUN curl https://bootstrap.pypa.io/get-pip.py | python3 \
	&& python3 -m pip install --upgrade pip setuptools \
	&& python3 -m pip install norminette

# downloading neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz \
	&& tar xzvf nvim-linux64.tar.gz \
	&& rm -rf nvim-linux64.tar.gz \
	&& ln -s /usr/local/bin/nvim-linux64/bin/nvim /usr/local/bin/ \
	&& mkdir -p /root/.config/nvim/ 

# downloading neovide
RUN wget https://github.com/neovide/neovide/releases/download/0.11.2/neovide-linux-x86_64.tar.gz \
	&& tar xzvf neovide-linux-x86_64.tar.gz \
	&& rm -rf neovide-linux-x86_64.tar.gz

# copying git credentials
RUN mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh \
    && ssh-keyscan github.com >> /root/.ssh/known_hosts

# setting nvim as default commit editor
RUN git config --global core.editor "nvim -u /root/.config/nvim/git_init.lua"

WORKDIR /app

ENTRYPOINT ["neovide", "--nofork"]
