return {
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
          sourceMaps = true,
          skipFiles = { "<node_internals>/**" },
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
}
