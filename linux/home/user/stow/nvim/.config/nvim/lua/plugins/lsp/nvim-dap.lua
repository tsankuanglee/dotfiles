-- mfussenegger/nvim-dap
-- https://github.com/mfussenegger/nvim-dap
-- Debug Adapter Protocol client implementation
--
return {
  keys = {
    { "<LOCALLEADER>dD", function() require("dap").disconnect() end, mode = "n", desc = "[DAP] disconnect from debuggee" },
    { "<LOCALLEADER>dC", function() require("dap").close() end, mode = "n", desc = "[DAP] close session" },
    { "<LOCALLEADER>dc", function() require("dap").continue() end, mode = "n", desc = "[DAP] Start/Continue <F5>" },
    { "<LOCALLEADER>dq", function() require("dap").terminate() end, mode = "n", desc = "[DAP] terminate" },
    { "<LOCALLEADER>drs", function() require("dap").restart() end, mode = "n", desc = "[DAP] restart" },
    { "<LOCALLEADER>drc", function() require("dap").run_to_cursor() end, mode = "n", desc = "[DAP] run to cursor" },
    { "<LOCALLEADER>drn", function() require("dap").run() end, mode = "n", desc = "[DAP] run (debug test cases)" },
    { "<LOCALLEADER>drl", function() require("dap").run_last() end, mode = "n", desc = "[DAP] run last" },
    { "<LOCALLEADER>dv", function() require("dap").step_over() end, mode = "n", desc = "[DAP] step over <F10>" },
    { "<LOCALLEADER>di", function() require("dap").step_into() end, mode = "n", desc = "[DAP] step into <F11>" },
    { "<LOCALLEADER>do", function() require("dap").step_out() end, mode = "n", desc = "[DAP] step out <S-F11>" },
    { "<LOCALLEADER>dV", function() require("dap").step_back() end, mode = "n", desc = "[DAP] step back" },
    { "<LOCALLEADER>d<UP>", function() require("dap").up() end, mode = "n", desc = "[DAP] go up stacktrace" },
    { "<LOCALLEADER>d<DOWN>", function() require("dap").down() end, mode = "n", desc = "[DAP] go doen stacktrace" },
    { "<LOCALLEADER>db", function() require("dap").set_breakpoint() end, mode = "n", desc = "[DAP] toggle breakpoint (also <F9>)" },
    { "<LOCALLEADER>dB", function() require("dap").set_breakpoint() end, mode = "n", desc = "[DAP] set breakpoint" },
    { "<LOCALLEADER>dt", function() require("dap").list_breakpoint() end, mode = "n", desc = "[DAP] list breakpoints" },
    { "<LOCALLEADER>dT", function() require("dap").clear_breakpoint() end, mode = "n", desc = "[DAP] clear breakpoints" },
    { "<LOCALLEADER>dx", function() require("dap").set_exception_breakpoints() end, mode = "n", desc = "[DAP] set set_exception_breakpoints" },
    { "<LOCALLEADER>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, mode = "n", desc = "[DAP] Log Point" },
    --     { "<LOCALLEADER>de", function() require("dap").repl.open() end, mode = "n", desc = "[DAP] open REPL" },
    { "<LOCALLEADER>dE", function() require("dap").repl.toggle() end, mode = "n", desc = "[DAP] toggle REPL" },
    { "<LOCALLEADER>dh", function() require("dap.ui.widgets").hover() end, mode = { "n", "v" }, desc = "[DAP] hover" },
    { "<LOCALLEADER>dp", function() require("dap.ui.widgets").preview() end, mode = { "n", "v" }, desc = "[DAP] preview" },
    { "<LOCALLEADER>df", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames) end, mode = "n", desc = "[DAP] frames" },
    { "<LOCALLEADER>ds", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) end, mode = "n", desc = "[DAP] scopes" },
    { "<F5>", function() require("dap").continue() end, mode = {"n", "v", "i"}, desc = "[DAP] Start/Continue" },
    { "<S-F5>", function() require("dap").terminate() end, mode = {"n", "v", "i"}, desc = "[DAP] terminate" },
    { "<C-S-F5>", function() require("dap").restart() end, mode = {"n", "v", "i"}, desc = "[DAP] restart" },
    { "<F10>", function() require("dap").step_over() end, mode = {"n", "v", "i"}, desc = "[DAP] step over" },
    { "<F11>", function() require("dap").step_into() end, mode = {"n", "v", "i"}, desc = "[DAP] step into" },
    { "<S-F11>", function() require("dap").step_out() end, mode = {"n", "v", "i"}, desc = "[DAP] step out" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, mode = {"n", "v", "i"}, desc = "[DAP] toggle breakpoint" },
  },
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local widgets = require("dap.ui.widgets")

    -- connection

    -- run

    -- steps

    -- breakpoints




    -- duplicated; similiar to VSCode

  end,
}
