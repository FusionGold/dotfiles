vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

-- Enable auto write
opt.autowrite = true

-- True color support
opt.termguicolors = true

-- Show line numbers
opt.number = true
-- Relative line numbers
opt.relativenumber = true

-- Merge sign column and number column into one
opt.signcolumn = "yes"

-- Enable highlighting of the current line
opt.cursorline = true

-- Manage character symbols
opt.fillchars = {
  eob = " ",
}

-- Maximum number of entries in a popup
opt.pumheight = 10

-- Force to select
opt.completeopt = "menu,menuone,noselect"

-- Lines of context
opt.scrolloff = 4
-- Columns of context
opt.sidescrolloff = 8

-- Enable line wrap
opt.wrap = false

-- Use visual bell (no beeping)
opt.visualbell = true

-- Ignore case
opt.ignorecase = true
-- Don't ignore case with capitals
opt.smartcase = true

-- Insert indents automatically
opt.smartindent = true

opt.cinoptions:append { 'g0' } -- Scope declarations align with braces.
opt.cinoptions:append { 'j1' } -- Anonymous classes are indented correctly.

-- Number of spaces tabs count for
opt.tabstop = 2
-- Size of an indent
opt.shiftwidth = 2
-- Round indent
opt.shiftround = true
-- Use spaces instead of tabs
opt.expandtab = true

-- Set the fold level
opt.foldlevel = 99

-- Fold method
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- completely hide concealed text
opt.conceallevel = 0
-- Conceal cursorline in some mode
opt.concealcursor = "nc"

-- Put new windows below current
opt.splitbelow = true
-- Put new windows right of current
opt.splitright = true
-- Keep text on the same screen line
opt.splitkeep = "screen"
