return {
  -- override nvim-autopairs plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- modify the sources part of the options table
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 700 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
    }

    opts.history = true
    opts.region_check_events = "InsertEnter"
    opts.delete_check_events = "TextChanged,InsertLeave"

    -- return the new table to be used
    return opts
  end,
}
