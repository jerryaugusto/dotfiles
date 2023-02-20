--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.go",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["q"] = ":q<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "dracula"
-- lvim.colorscheme = "onedark"
lvim.colorscheme = "rose-pine"

lvim.builtin.lualine.active = true
-- lvim.builtin.lualine.options.theme = "dracula-nvim"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "jerryaugusto/draculapro.nvim",
    config = function()
      require("dracula").setup({
        lualine_bg_color = "#22212C",
        transparent_bg = true
      })
    end
  },
  {
    'rose-pine/neovim',
    -- as = 'rose-pine',
    config = function()
      require("rose-pine").setup()
      -- vim.cmd('colorscheme rose-pine')
    end
  },
  {
    "ellisonleao/glow.nvim",
    config = function() require("glow").setup() end,
    ft = { "markdown" }
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  -- {
  --   "mhanberg/elixir.nvim",
  --   config = function()
  --     require("elixir").setup()
  --   end
  -- },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "haydenmeade/neotest-jest",
      -- "nvim-neotest/neotest-go",
    },
    config = function ()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup({
        -- your neotest config here
        adapters = {
          require('neotest-vitest'),
          require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
      require("neotest").run.run(vim.fn.expand("%"))
      vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", {})
    end
  },
  {
    "folke/neodev.nvim",
    config = function ()
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true }
      })
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function ()
      require("toggleterm").setup()
    end
  },
  {
    'folke/noice.nvim',
    config = function ()
      require("noice").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    }
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup()
      vim.api.nvim_set_keymap("n", "<leader-t>", ":TroubleToggle document_diagnostics<cr>", { silent = true })
    end
  },
}

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
