return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  depenencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    local dp = require("dap-python")
    dp.test_runner = 'pytest'
    dp.setup(path)

    local km = require("utils").km -- keymap shortcut function
    km("n", "<LOCALLEADER>dyr", function () dp.test_method() end, "[DAP-python] test_method")
    km("n", "<LOCALLEADER>dyf", function () dp.test_class() end, "[DAP-python] test_class")
    km("v", "<LOCALLEADER>dys", function () dp.debug_selection() end, "[DAP-python] debug_selection test_class")

  end,
}
