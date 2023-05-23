# ABOUT

Dockide is a **fully-featured**, **hermetic** neovim configuration, with 
[docker](https://docs.docker.com/engine/install/) as its only dependency. By
default, it is set up for c development witht the clang compiler and ccpdbg.
Feel free to build on the base image to add any dependency you need.

---

## Features

- debugger ([nvim-dap](https://github.com/mfussenegger/nvim-dap))
- autocompletion ([nvim-lspconfig](https://github.com/neovim/nvim-lspconfig))
- git integration ([lazygit](https://github.com/kdheepak/lazygit.nvim))
- terminal integration ([toggleterm](https://github.com/akinsho/toggleterm.nvim)
- file tree ([nvim-tree](https://github.com/nvim-tree/nvim-tree.lua))
- norminette linting (for 42 schools)

and much, much more

---

## Installation

> _PLease note that you will need to have [docker](https://docs.docker.com/engine/install/) installed for dockIDE to work_

```sh
git clone https://github.com/Trantorian1/DockIDE.git && ./install
```

To run **dockide**, make sure that **$HOME/bin** is part of your **PATH**

```sh
dockide
```

or

```sh
./dockide # if $HOME/bin is not part of your path
```

Downloading the docker image might take some time at first but after that 
you're good to go!
