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
  "rcarriga/nvim-dap-ui",
  depenencies = {
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    -- dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    -- dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    local km = require("utils").km -- keymap shortcut function
    km("n", "<LOCALLEADER>duo", function () dapui.open() end, "[DAP-ui] open UI")
    km("n", "<LOCALLEADER>dur", function () dapui.open({ reset = true}) end, "[DAP-ui] open reset UI")
    km("n", "<LOCALLEADER>duc", function () dapui.close() end, "[DAP-ui] close UI")
    km("n", "<LOCALLEADER>dut", function () dapui.toggle() end, "[DAP-ui] toggle UI")
    km("n", "<F4>", function () dapui.float_element() end, "[DAP-ui] select float")
    km("n", "<LOCALLEADER>dF", function () dapui.float_element() end, "[DAP-ui] select float")
    km("n", "<LOCALLEADER>de", function () dapui.eval() end, "[DAP-ui] eval cursor/visual")

  end,
}
