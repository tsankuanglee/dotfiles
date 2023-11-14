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
    dp.setup(path)

    local km = require("utils").km -- keymap shortcut function
    km("n", "<LOCALLEADER>dyr", function () dp.test_method() end, "[DAP-python] run test_method")

  end,
}
