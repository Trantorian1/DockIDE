FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y clang
RUN apt-get install -y wget
RUN apt-get install -y tar
RUN apt-get install -y git
RUN apt-get install -y unzip
RUN apt-get install -y curl
RUN apt-get install -y gdb

RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
tar xf lazygit.tar.gz lazygit && \
install lazygit /usr/local/bin

WORKDIR /bin

RUN wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
RUN tar xzvf nvim-linux64.tar.gz && rm -rf nvim-linux64.tar.gz
RUN ln -s /bin/nvim-linux64/bin/nvim /bin/
RUN mkdir -p $HOME/.config/nvim

ENV PATH $PATH:/app/nvim-linux64/bin

WORKDIR /app

CMD ["nvim"]
