return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- Vim test
    ["<leader>tn"] = { "<cmd>Neotest run<cr>", desc = "Test nearest" },
    ["<leader>tb"] = { "<cmd>Neotest run file<cr>", desc = "Test Buffer" },
    ["<leader>ts"] = { function() require("neotest").run.run { suite = true } end, desc = "Test suite" },
    ["<leader>tl"] = { "<cmd>Neotest run last<cr>", desc = "Test last" },
    ["<leader>to"] = { "<cmd>Neotest output<cr>", desc = "Test output" },
    ["<leader>td"] = {
      function() require("neotest").run.run { strategy = "dab", suite = false } end,
      desc = "Test Nearest with debug",
    },
    ["<leader>ta"] = { "<cmd>Neotest attach<cr>", desc = "Test attach" },

    ["<C-b>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>o"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
    ["<leader>x"] = { "<cmd>close<cr>", desc = "Close buffer" },
    ["<leader>cr"] = { "<cmd>RustRunnables<cr>", desc = "Rust runnables" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["qn"] = { "<cmd>cn<cr>", desc = "Quickfix next" },
    ["qp"] = { "<cmd>cp<cr>", desc = "Quickfix previous" },
    ["<leader>co"] = { "<cmd>copen<cr>", desc = "Open quickfix list" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-o>"] = { "<C-\\><C-n>", desc = "Normal mode term" },
  },
  v = {
    ['<leader>fc'] = {function() require("telescope.builtin").grep_string() end, desc="Search selection under cursor"}
  }
}
