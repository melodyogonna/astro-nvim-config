return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      "python",
      "javascript",
      "lua",
      "typescript",
      "html",
      "htmldjango",
      "css",
      "scss",
      "vue",
      "json",
      "go",
      "rust",
      "markdown",
      "c",
      "zig",
      "swift",
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",

          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

          -- Inner if - For conditionals
          ["ii"] = { query = "@conditional.inner", desc = "Select inner conditional - inner if" },
          ["ai"] = { query = "@conditional.outer", desc = "Select outer conditional - outer if" },

          -- Loop
          ["il"] = { query = "@loop.inner", desc = "Select inner loop" },
          ["al"] = { query = "@loop.outer", desc = "Select outer loop" },
        },
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },

        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]f"] = { query = "@function.outer", desc = "Next function start" },
          ["]c"] = { query = "@class.outer", desc = "Next class start" },
        },
        goto_next_end = {
          ["]F"] = { query = "@function.outer", desc = "Next function end" },
          ["]C"] = { query = "@class.outer", desc = "Next class end" },
        },
        goto_previous_start = {
          ["[f"] = { query = "@function.outer", desc = "Previous function start" },
          ["[c"] = { query = "@class.outer", desc = "Previous class start" },
        },
        goto_previous_end = {
          ["[F"] = { query = "@function.outer", desc = "Previous function end" },
          ["[C"] = { query = "@class.outer", desc = "Previous class end" },
        },
        -- Below will go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        -- Make it even more gradual by adding multiple queries and regex.
        goto_next = {
          ["]i"] = { query = "@conditional.outer", desc = "Next conditional (if statement)" },
          ["]l"] = { query = "@loop.outer", desc = "Next loop" },
        },
        goto_previous = {
          ["[i"] = { query = "@conditional.outer", desc = "Previous conditional (If statement)" },
          ["[l"] = { query = "@loop.outer", desc = "Previous loop" },
        },
      },
      lsp_interop = {
        enable = true,
        border = "none",
        floating_preview_opts = {},
        peek_definition_code = {
          ["tf"] = { query = "@function.outer", desc = "Peek function function" },
          ["tc"] = { query = "@class.outer", desc = "Peak class (object) definition" },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          [">a"] = {
            desc = "Swap next argument",
            query = "@parameter.inner",
          },
          [">f"] = {
            desc = "Swap next function",
            query = "@function.outer",
          },
        },
        swap_previous = {
          ["<a"] = {
            desc = "Swap previous argument",
            query = "@parameter.inner",
          },
          ["<f"] = {
            desc = "Swap previous function",
            query = "@function.outer",
          },
        },
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>s", -- set to `false` to disable one of the mappings
        scope_incremental = "<CR>",
        node_incremental = "<TAB>",
        node_decremental = "<S-TAB>",
      },
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
  },
}
