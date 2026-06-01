-- mfussenegger/nvim-dap-python
-- https://github.com/mfussenegger/nvim-dap-python
-- Extension for nvim-dap providing default configurations for python
--
return {
  keys = {
    { "<LOCALLEADER>dyr", function () require("dap-python").test_method() end, mode = "n", desc = "[DAP-python] test_method" },
    { "<LOCALLEADER>dyf", function () require("dap-python").test_class() end, mode = "n", desc = "[DAP-python] test_class" },
    { "<LOCALLEADER>dys", function () require("dap-python").debug_selection() end, mode = "v", desc = "[DAP-python] debug_selection test_class" },
  },
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


  end,
}
