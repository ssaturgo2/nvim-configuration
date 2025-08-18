-- keybinds
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- theme
vim.cmd.colorscheme('gruvbox-material') -- set theme
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indentations
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- backups and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- others
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
vim.opt.scrolloff = 8
vim.opt.fillchars = {eob = " "} -- replace '~' symbols to blank space
vim.opt.cursorline = true
