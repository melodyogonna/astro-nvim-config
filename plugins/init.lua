return {
  -- Wakatime
  { "wakatime/vim-wakatime", lazy = false },
  -- vim test
  { "vim-test/vim-test", lazy = false },
  -- Fox themes
  { "EdenEast/nightfox.nvim", event = "User AstroFile" },
  -- Neorg
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers", -- This is the important bit!
    cmd = "Neorg",
    config = function()
      require("neorg").setup {
        -- configuration here
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                work = "~/Documents/notes/work",
                personal = "~/Documents/notes/personal",
              },
            },
          },
          ["core.concealer"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      }
    end,
  },
  { "tpope/vim-fugitive", cmd = "G" },
  { "simrat39/rust-tools.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "rust_analyzer" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
    enabled = false,
  },
  {
    "amadeus/vim-mjml",
    ft = "mjml",
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "ray-x/guihua.lua",
    },
    config = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    event = "VeryLazy",
    config = function()
      require("dap-vscode-js").setup {
        debugger_path = "/Users/melody/dev/microsoft/vscode-js-debug",
        adapters = { "pwa-node" },
      }
      for _, language in ipairs { "typescript", "javascript" } do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            stopOnEntry = true,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },

          {
            type = "pwa-node",
            request = "launch",
            name = "Launch ts-node",
            program = "${file}",
            runtimeExecutable = "${workspaceFolder}/node_modules/.bin/ts-node",
            cwd = "${workspaceFolder}",
            outFiles = {
              "${workspaceFolder}/dist/**/*.js",
            },
          },

          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
        }
      end
    end,
  },
}
