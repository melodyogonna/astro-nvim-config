-- Neorg
return {
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
              cwd = vim.fn.getcwd(),
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
}
