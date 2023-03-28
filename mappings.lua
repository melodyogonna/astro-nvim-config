return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- Vim test
    ["<leader>tn"] = { "<cmd>TestNearest<cr>", desc = "Test nearest" },
    ["<leader>tb"] = { "<cmd>TestFile<cr>", desc = "Test file" },
    ["<leader>ts"] = { "<cmd>TestSuite<cr>", desc = "Test suite" },
    ["<leader>tl"] = { "<cmd>TestLast<cr>", desc = "Test last" },

    ["<C-b>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>o"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
    ["<leader>x"] = { "<cmd>close<cr>", desc = "Close buffer" },
    ["<leader>cr"] = { "<cmd>Crun<cr>", desc = "Cargo run" },
    ["<leader>ct"] = { "<cmd>Ctest<cr>", desc = "Cargo test" },
    ["<localleader>n"] = { "<cmd>Neorg<cr>", desc = "Open Neorg Telescope" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-o>"] = { "<C-\\><C-n>", desc = "Normal mode term" },
  },
}
