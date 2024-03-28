return {
  -- Wakatime
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  -- vim test
  { "vim-test/vim-test", event = "VeryLazy" },
  -- Fox themes
  { "EdenEast/nightfox.nvim", event = "User AstroFile" },
  { "folke/tokyonight.nvim", event = "User AstroFile" },
  { "rebelot/kanagawa.nvim", event = "User AstroFile" },

  { "tpope/vim-fugitive", cmd = "G" },
  { "simrat39/rust-tools.nvim", ft = "rust" },
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
    config = function() require("nvim-surround").setup {} end,
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
    "tpope/vim-dispatch",
    event = "VeryLazy",
  },

  { "max397574/better-escape.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "Shatur/neovim-session-manager", enabled = false },
}
