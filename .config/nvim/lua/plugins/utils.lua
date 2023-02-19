require 'nvim-web-devicons'.get_icons()

require("lfs")

local function dot_git_exists()
  local path = "./.git"
  if (lfs.attributes(path, "mode") == "directory") then
    return true
  end
  return false
end

if dot_git_exists() then
  branch = '-branch'
else
  branch = '-📁'
end

local function get_var(my_var_name)
  return vim.api.nvim_get_var(my_var_name)
end

extension = get_var("extension")
filenamel = get_var("filenamev")

if extension == "ts" or extension == "tsx" or extension == "py" or extension == "jsx" or extension == "lua" or
    extension == "ex" then
  this_lsp = '-lsp_name'
else
  this_lsp = '-file_size'
end


require('staline').setup {
  sections = {
    left  = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
    mid   = { 'file_name', ' ', 'lsp_name' },
    right = { 'cool_symbol', 'right_sep_double', '-line_column' },
  },

  defaults = {
    fg              = "#1E1320",
    cool_symbol     = "",
    branch_symbol   = " ",
    left_separator  = "",
    right_separator = "",
    --line_column = "%l:%c [%L]",
    true_colors     = false,
    line_column     = "[%l:%c] 並%p%% ",
    stab_start      = "",
    stab_end        = ""
    --font_active = "bold"
  },
  mode_colors = {
    n  = "#9580FF", --Purple
    i  = "#8AFF80", --Green
    ic = "#FF9580", --Red
    c  = "#80FFEA", --Cyan
    v  = "#FFCA80" --Orange
  }
}


-- vim.opt.listchars:append "space:•"
--vim.opt.listchars:append("eol:↴")
vim.cmd [[set list listchars=space:⋅,tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⌴]] -- ␣⌴
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#FF9580 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#FFCA80 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#8AFF80 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#80FFEA gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#9580FF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#FF80BF gui=nocombine]]

vim.cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#F8F8F2
  let g:indentLine_fileTypeExclude = ['dashboard']
]])


require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
}

require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

require("bufferline").setup {}


require 'lspconfig'.prosemd_lsp.setup {}
