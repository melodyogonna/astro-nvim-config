return {

  -- Wakatime
  { "wakatime/vim-wakatime" },

  -- vim test
  { "vim-test/vim-test" },

  -- Treesitter text object
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- Color scheme
  { "christianchiarulli/nvcode-color-schemes.vim" },

  -- Vim sandwich
  { "machakann/vim-sandwich" },

  -- Fox themes
  { "EdenEast/nightfox.nvim" },

  -- Neorg
  ["nvim-neorg/neorg"] = {
    run = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
        require("neorg").setup {
            -- configuration here
           load = {
             ["core.defaults"] = {},
             ["core.norg.dirman"] = {
               config = {
                 workspaces = {
                   work = "~/Documents/notes/work",
                   home = "~/Documents/notes/personal",
                 }
               }
             },
             ["core.norg.concealer"] = {},
             ["core.norg.completion"] = {}
           }
         }
    end,
  }
}
