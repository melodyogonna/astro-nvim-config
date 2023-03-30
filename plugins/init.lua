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
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/Documents/notes/work",
                personal = "~/Documents/notes/personal",
              },
            },
          },
          ["core.norg.concealer"] = {},
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      }
    end,
  },
  { "tpope/vim-fugitive", cmd = "G" },
  { "fatih/vim-go", ft = "go" },
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
}
