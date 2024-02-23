# Neovim Config

## Project Structure
```bash
.
├── README.md # This file
├── init.lua # just loads all the lua files
├── lua/
│   ├── allison/
│   │   ├── settings.lua # global settings for neovim
│   │   ├── lazy.lua # setup lazy.nvim and load all the plugins in the plugins folder
│   │   ├── keymap.lua # setup some useful keymaps
│   ├── plugins/
│   │   ├── blakeline.lua # adds dotted lines to denote and highlight blocks of code
│   │   ├── comment.lua # adds a comment toggle keymap
│   │   ├── dressing.lua # replaces some UI elements with better looking ones
│   │   ├── git-signs.lua # adds git signs to the gutter (left side of the window)
│   │   ├── harpoon.lua # awesome plugin, more details below
│   │   ├── lualine.lua # adds a statusline at the bottom of the window with icons and stuff
│   │   ├── oil.lua # adds a file explorer that is better than the default one
│   │   ├── telescope.lua # adds a fuzzy finder and a lot more
│   │   ├── theme.lua # uses gruvbox-material theme with some customizations
│   │   ├── treesitter.lua # adds treesitter for awesome syntax highlighting
│   │   ├── undotree.lua # a plugin to visualize all the changes ever made to a file
│   │   ├── which-key.lua # adds a popup with all the keymaps
```

## Global Settings
- enamble line numbers
- disable relative line numbers
- disable wrap (enamble if you want)
- set scrolloff to 8 (:help scrolloff for more info)

- enamble termguicolors (enables true color support)

- set some good split defaults
  - splitbelow
  - splitright

- set tabstop and other stuff 
(it's a bit involved, check the docs for more info)

- disable swap files and backup files in favaor of undo files
- set the undodir to ~/.vim/undodir

- Set some good search defaults

- always show the signcolumn

- set some code folding defaults.
> Folds are not enabled by default 
so you need a plugin to enable them.
I use a plugin called `ufo` for this.
