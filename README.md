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
│   ├── lsp/ # all the LSP related settings
│   │   ├── init.lua
│   │   ├── format.lua
│   │   ├── lsp_attach.lua # attaches the LSP to the current buffer and sets up keymaps
│   │   ├── servers.lua # all the LSP servers and their config
```

## keymaps
- `Shift + J` and `Shift + K` to move lines up and down 
> (press `Shift + V` to select lines and then `Shift + J` or `Shift + K` to move them)

- Remap `Shift + U` to redo

- `<Leader> + y` to copy to system clipboard
- `<Leader> + Shift + y` to copy to system clipboard from the cursor to end of the line
- `<Leader> + p` to paste from system clipboard
- `<Leader> + Shift + p` to paste from system clipboard before the cursor
- `<Leader> + e` to open the file explorer (oil.nvim)
    - `Alt + s` to force apply any changes without a conformation
- `gcc` to comment or uncomment a line
- `gc` to comment or uncomment a block of code (visual mode)

- `<Leader> + ff` to get a list of all open buffers
- `<Leader> + space` to get a list of all the files in the current dir where nvim is opend
- `Ctrl + s` to run a search over all the files in the current dir where nvim is opend

- `<Leader> + u` to toggle undotree to look at all the changes made to the files

## LSP Keymaps (only if you have LSP enabled for the current file)
- `gd` to go to definition of the word under the cursor
- `gD` to go to the declaration of the word under the cursor
- `gr` to find references of the word under the cursor
- `gI` to go to the implementations of the word under the cursor
- `K` to get the documentation of the word under the cursor
- `Ctrl + k` to get signature help for the word under the cursor
- `<Leader> + D` to get the type of the word under the cursor
- `<Leader> + ds` to get all the symbols in the current files
- `<Leader> + ws` to get all the symbols in the current workspace
- `<Leader> + rn` to LSP rename the word under the cursor
- `<Leader> + ca` to LSP code action for the word under the cursor
- `<Leader + dd` to show LSP diagnostics
    - `q` to close the diagnostics window (if cursor is in the diagnostics window)
    - `<Leader> + dd` to toggle the diagnostics window (if not in diagnostics window already)
    - `Shift + K` on a line to see the full error message
- `<Leader> + f` to format the current file (more info at the botto)

## Harpoon
Harpoon is a plugin that allows you to switch between a set of files
quickly and easily. It's like a bookmark system for files.

Harpoon holds a list of files that you can switch between using a keymap.
You can add the current file to the list of files and then switch to any of the files in the list.

- `<Leader> + a` to add the current file to the list of files
- `<Leader> + hh` to show the list of files
    - Harpoon window is a normal buffer so you can use `j` and `k` to move up and down
    - `Enter` to open the file under the cursor
    - `q` to close the Harpoon window
    - `dd` to delete the file under the cursor from the list
    - any other vim command to do whatever you want with the file list

- `<Leader> + ha` to open the first file in the list
- `<Leader> + hs` to open the second file in the list
- `<Leader> + hd` to open the third file in the list
- `<Leader> + hf` to open the forth file in the list

You can set more keymaps in the `lua/plugins/harpoon.lua` file.


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

## Formatting
For formatting `conform.nvim` is used
It uses a formatter cinfigured in the `lua/lsp/format.lua` file
or the one provided by the LSP server if it's available.
To install a formatter run `:Mason` and select the formatter you want to install.
and then tell `conform.nvim` to use that formatter by adding it to the `lua/lsp/format.lua` file.
- `<Leader> + f` to format the current file (more info at the botto)
