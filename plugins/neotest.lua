return {
  "nvim-neotest/neotest",
  cmd = "Neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
    "lawrence-laz/neotest-zig",
    "nvim-neotest/neotest-vim-test",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python",
        require "neotest-jest",
        require "neotest-go",
        require "neotest-zig",
        require "neotest-vim-test" { ignore_filetypes = { "python", "javascript", "go", "typescript" } },
      },
    }
  end,
}
