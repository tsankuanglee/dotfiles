-- rcarriga/nvim-dap-ui
-- https://github.com/rcarriga/nvim-dap-ui
-- A UI for nvim-dap
--
--[[ ui for nvim-dap
default shortcuts:
* edit: e
* expand: <CR> or left click
* open: o
* remove: d
* repl: r
* toggle: t
]]
return {
  keys = {
    { "<LOCALLEADER>duo", function () require("dapui").open() end, mode = "n", desc = "[DAP-ui] open UI" },
    { "<LOCALLEADER>dur", function () require("dapui").open({ reset = true}) end, mode = "n", desc = "[DAP-ui] open reset UI" },
    { "<LOCALLEADER>duc", function () require("dapui").close() end, mode = "n", desc = "[DAP-ui] close UI" },
    { "<LOCALLEADER>dut", function () require("dapui").toggle() end, mode = "n", desc = "[DAP-ui] toggle UI" },
    { "<F4>", function () require("dapui").float_element() end, mode = "n", desc = "[DAP-ui] select float" },
    { "<LOCALLEADER>dF", function () require("dapui").float_element() end, mode = "n", desc = "[DAP-ui] select float" },
    { "<LOCALLEADER>de", function () require("dapui").eval() end, mode = "n", desc = "[DAP-ui] eval cursor/visual" },
  },
  "rcarriga/nvim-dap-ui",
  depenencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-virtual-text"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    -- dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    -- dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end


  end,
}
