vim.cmd([[ let extension = expand('%:e') ]])
vim.cmd([[ let filenamev = expand('%:t') ]])

vim.g.mapleader = " "

-- vim.opt.encoding = 'utf8'
vim.o.encoding = 'utf-8'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

-- vim.cmd([[ set mouse=a ]])
-- vim.cmd([[ set wildmenu ]])
-- vim.cmd([[ set confirm ]])
-- vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
-- vim.cmd([[ set expandtab ]])
-- vim.cmd([[ set guicursor= ]])
-- vim.cmd([[ set cursorline ]])
-- vim.cmd([[ syntax on ]])

vim.opt.errorformat:append('%f|%l col %c|%m')
vim.opt.errorformat:prepend('%f|%l col %c|%m')
vim.opt.errorformat:remove('%f|%l col %c|%m')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[ set bg=dark ]])
vim.o.termguicolors = true

--vim.cmd([[ colorscheme peachpuff ]])
--vim.cmd([[ colorscheme gruvbox ]])
--require('onedark').load()
--vim.cmd([[ colorscheme dracula_pro ]])


--  Highlight Trailing Whitespaces
vim.cmd [[match Error /\s\+$/]]

-- Highlight Trailing Whitespaces
vim.cmd [[match ErrorMsg /\s\+$/]]


-- vim.cmd([[
--   highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF9580 gui=bold
--   highlight! DiagnosticError guibg=#22212C guifg=#FF9580 gui=bold
--   "highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFFF80 gui=bold
--   highlight! DiagnosticWarn guibg=#22212C guifg=#FFFF80 gui=bold
--   highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#80FFEA gui=bold
--   highlight! DiagnosticInfo guibg=#22212C guifg=#80FFEA gui=bold
--   highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#9580FF gui=bold
--   highlight! DiagnosticHint guibg=#22212C guifg=#9580FF gui=bold
--
--   sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
--   sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
--   sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
--   sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
-- ]])
