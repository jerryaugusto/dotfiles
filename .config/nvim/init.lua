require("plugins.plugins")
require("configs.settings")
require("configs.mappings")
require("plugins.utils")
require("plugins.complete")
require("plugins.news")
require("plugins.telescope")

vim.cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFF80
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  endif
]])

