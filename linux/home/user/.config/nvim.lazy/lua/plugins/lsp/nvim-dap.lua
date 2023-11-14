return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local widgets = require("dap.ui.widgets")

    local km = require("utils").km -- keymap shortcut function
    -- connection
    km("n", "<LOCALLEADER>dD", function() dap.disconnect() end, "[DAP] disconnect from debuggee")
    km("n", "<LOCALLEADER>dC", function() dap.close() end, "[DAP] close session")

    -- run
    km("n", "<LOCALLEADER>dc", function() dap.continue() end, "[DAP] Start/Continue <F5>")
    km("n", "<LOCALLEADER>dq", function() dap.terminate() end, "[DAP] terminate")
    km("n", "<LOCALLEADER>drs", function() dap.restart() end, "[DAP] restart")
    km("n", "<LOCALLEADER>drc", function() dap.run_to_cursor() end, "[DAP] run to cursor")
    km("n", "<LOCALLEADER>drn", function() dap.run() end, "[DAP] run (debug test cases)")
    km("n", "<LOCALLEADER>drl", function() dap.run_last() end, "[DAP] run last")

    -- steps
    km("n", "<LOCALLEADER>dv", function() dap.step_over() end, "[DAP] step over <F10>")
    km("n", "<LOCALLEADER>di", function() dap.step_into() end, "[DAP] step into <F11>")
    km("n", "<LOCALLEADER>do", function() dap.step_out() end, "[DAP] step out <S-F11>")
    km("n", "<LOCALLEADER>dV", function() dap.step_back() end, "[DAP] step back")
    km("n", "<LOCALLEADER>d<UP>", function() dap.up() end, "[DAP] go up stacktrace")
    km("n", "<LOCALLEADER>d<DOWN>", function() dap.down() end, "[DAP] go doen stacktrace")

    -- breakpoints
    km("n", "<LOCALLEADER>db", function() dap.set_breakpoint() end, "[DAP] toggle breakpoint (also <F9>)")
    km("n", "<LOCALLEADER>dB", function() dap.set_breakpoint() end, "[DAP] set breakpoint")
    km("n", "<LOCALLEADER>dt", function() dap.list_breakpoint() end, "[DAP] list breakpoints")
    km("n", "<LOCALLEADER>dT", function() dap.clear_breakpoint() end, "[DAP] clear breakpoints")

    km("n", "<LOCALLEADER>dx", function() dap.set_exception_breakpoints() end, "[DAP] set set_exception_breakpoints")
    km("n", "<LOCALLEADER>dl", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, "[DAP] Log Point")

    -- km("n", "<LOCALLEADER>de", function() dap.repl.open() end, "[DAP] open REPL")
    km("n", "<LOCALLEADER>dE", function() dap.repl.toggle() end, "[DAP] toggle REPL")

    km({ "n", "v" }, "<LOCALLEADER>dh", function() widgets.hover() end, "[DAP] hover")
    km({ "n", "v" }, "<LOCALLEADER>dp", function() widgets.preview() end, "[DAP] preview")
    km("n", "<LOCALLEADER>df", function() widgets.centered_float(widgets.frames) end, "[DAP] frames")
    km("n", "<LOCALLEADER>ds", function() widgets.centered_float(widgets.scopes) end, "[DAP] scopes")

    -- duplicated; similiar to VSCode
    km({"n", "v", "i"}, "<F5>", function() dap.continue() end, "[DAP] Start/Continue")
    km({"n", "v", "i"}, "<S-F5>", function() dap.terminate() end, "[DAP] terminate")
    km({"n", "v", "i"}, "<C-S-F5>", function() dap.restart() end, "[DAP] restart")
    km({"n", "v", "i"}, "<F10>", function() dap.step_over() end, "[DAP] step over")
    km({"n", "v", "i"}, "<F11>", function() dap.step_into() end, "[DAP] step into")
    km({"n", "v", "i"}, "<S-F11>", function() dap.step_out() end, "[DAP] step out")
    km({"n", "v", "i"}, "<F23>", function() dap.step_out() end, "[DAP] step out") -- terminal emulator
    km({"n", "v", "i"}, "<F9>", function() dap.toggle_breakpoint() end, "[DAP] toggle breakpoint")

  end,
}
