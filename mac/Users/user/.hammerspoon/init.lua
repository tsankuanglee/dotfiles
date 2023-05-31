--
--
-- ref: https://aaronlasseigne.com/2016/02/16/switching-from-slate-to-hammerspoon/
-- ref: https://github.com/oschrenk/dotfiles/blob/master/.hammerspoon/init.lua

hs.window.animationDuration = 0

local windowSizeCache = {}
local modals = {}

function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end


function notify(message)
  hs.notify.show(message, "", "")
  --hs.notify.new({
  --  title='Hammerspoon',
  --  informativeText=message,
  --  -- hide the action button, show only "Close"
  --  hasActionButton=false
  --}):send()
end

function reloadConfig(files)
  local doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
    hs.alert.show('Config Reloaded')
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()




function bindKey(key, fn)
  hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, key, fn)
end

positions = {
  maximized = hs.layout.maximized,
  centered = {x=0.15, y=0.15, w=0.7, h=0.7},
  centered_full_height = {x=0.15, y=0, w=0.7, h=1},

  third_nw = {x=0,    y=0,    w=0.33, h=.33},
  third_n =  {x=0.33, y=0,    w=0.33, h=.33},
  third_ne = {x=0.66, y=0,    w=0.34, h=.33},
  third_w =  {x=0,    y=0.33, w=0.33, h=.33},
  third_c =  {x=0.33, y=0.33, w=0.33, h=.33},
  third_e =  {x=0.66, y=0.33, w=0.34, h=.33},
  third_sw = {x=0,    y=0.66, w=0.33, h=.34},
  third_s =  {x=0.33, y=0.66, w=0.33, h=.34},
  third_se = {x=0.66, y=0.66, w=0.34, h=.34},

  left34 = {x=0, y=0, w=0.34, h=1},
  left50 = hs.layout.left50,
  left66 = {x=0, y=0, w=0.66, h=1},
  left70 = hs.layout.left70,

  right30 = hs.layout.right30,
  right34 = {x=0.66, y=0, w=0.34, h=1},
  right50 = hs.layout.right50,
  right66 = {x=0.34, y=0, w=0.66, h=1},

  upper50 = {x=0, y=0, w=1, h=0.5},
  upper50Left50 = {x=0, y=0, w=0.5, h=0.5},
  upper50Right15 = {x=0.85, y=0, w=0.15, h=0.5},
  upper50Right30 = {x=0.7, y=0, w=0.3, h=0.5},
  upper50Right50 = {x=0.5, y=0, w=0.5, h=0.5},

  lower50 = {x=0, y=0.5, w=1, h=0.5},
  lower50Left50 = {x=0, y=0.5, w=0.5, h=0.5},
  lower50Right50 = {x=0.5, y=0.5, w=0.5, h=0.5},

  chat = {x=0.5, y=0, w=0.35, h=0.5}
}

----
---- Layouts
----
--
--layouts = {
--   {
--     name="Coding",
--     description="For fun and profit",
--     small={
--       {"Firefox", nil, screen, positions.left70, nil, nil},
--       {"Twitter", nil, screen, positions.right30, nil, nil},
--     },
--     large={
--       {"Firefox", nil, screen, positions.left50, nil, nil},
--       {"Twitter", nil, screen, positions.upper50Right30, nil, nil},
--     }
--   },
--   {
--     name="Blogging",
--     description="Time to write",
--     small={
--       {"Firefox", nil, screen, positions.left50, nil, nil},
--       {"iTerm",   nil, screen, positions.right50, nil, nil},
--     }
--   },
--   {
--     name="Work",
--     description="Pedal to the metal",
--     small={
--       {"Firefox", nil, screen, positions.maximized, nil, nil},
--       {"Slack",   nil, screen, positions.maximized, nil, nil},
--       {"Twitter", nil, screen, positions.right30, nil, nil},
--     },
--     large={
--       {"Firefox", nil, screen, positions.left50, nil, nil},
--       {"Firefox", "Console - ", screen, positions.lower50Right50, nil, nil},
--       {"Slack",   nil, screen, positions.chat, nil, nil},
--       {"Twitter", nil, screen, positions.upper50Right15, nil, nil},
--     }
--   },
--}
--currentLayout = null
--
--function applyLayout(layout)
--  local screen = hs.screen.mainScreen()
--
--  local layoutSize = layout.small
--  if layout.large and screen:currentMode().w > 1500 then
--    layoutSize = layout.large
--  end
--
--  currentLayout = layout
--  hs.layout.apply(layoutSize, function(windowTitle, layoutWindowTitle)
--    return string.sub(windowTitle, 1, string.len(layoutWindowTitle)) == layoutWindowTitle
--  end)
--end
--
--layoutChooser = hs.chooser.new(function(selection)
--  if not selection then return end
--
--  applyLayout(layouts[selection.index])
--end)
--i = 0
--layoutChooser:choices(hs.fnutils.imap(layouts, function(layout)
--  i = i + 1
--
--  return {
--    index=i,
--    text=layout.name,
--    subText=layout.description
--  }
--end))
--layoutChooser:rows(#layouts)
--layoutChooser:width(20)
--layoutChooser:subTextColor({red=0, green=0, blue=0, alpha=0.4})
--
--bindKey(';', function()
--  layoutChooser:show()
--end)
--
--hs.screen.watcher.new(function()
--  if not currentLayout then return end
--
--  applyLayout(currentLayout)
--end):start()


-- Toggle a window between its normal size, and being maximized
function toggle_window_maximized()
    local win = hs.window.focusedWindow()
    if windowSizeCache[win:id()] then
        win:setFrame(windowSizeCache[win:id()])
        windowSizeCache[win:id()] = nil
    else
        windowSizeCache[win:id()] = win:frame()
        win:maximize()
    end
end

-- Send Window Prev Monitor
function send_window_to_prev_monitor()
  if (#hs.screen.allScreens() > 1) then
    local win = hs.window.focusedWindow()
    local previousScreen = win:screen():previous()
    win:moveToScreen(previousScreen)
    --notify("Prev Monitor", 5)
  end
end

-- Send Window Next Monitor
function send_window_to_next_monitor()
  if (#hs.screen.allScreens() > 1) then
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():next()
    print(nextScreen:id())
    win:moveToScreen(nextScreen)
    --notify("Next Monitor")
  end
end

-- Send Window to Specified Monitor
function send_window_to_target_monitor(hint)
  -- print(hint)
  if (#hs.screen.allScreens() > 1) then
    local win = hs.window.focusedWindow()
    targetScreen = hs.screen.find(hint)
    --print(targetScreen)
    win:moveToScreen(targetScreen)
  end
end



bindKey("return", toggle_window_maximized)
bindKey("n", send_window_to_next_monitor)
bindKey("p", send_window_to_prev_monitor)



-- move directly to the target screen
-- screen ID can be found in consoel with send_window_to_next_monitor
-- Built-in Retina Display
bindKey("0", function()
  send_window_to_target_monitor(69734662)
end)
bindKey("7", function()
  send_window_to_target_monitor(724041799)
bindKey("8", function()
  -- center large screen
  --send_window_to_target_monitor("LG Ultra HD")
  send_window_to_target_monitor(458678269)
end)
bindKey("9", function()
  send_window_to_target_monitor(724070472)
end)
end)
--2022-03-28 19:53:13: hs.screen: DELL P2419HC (1) (0x6000005fbe38)
--2022-03-28 19:53:14: hs.screen: DELL P2419HC (2) (0x600000aaed78)
--2022-03-28 19:53:15: hs.screen: Built-in Retina Display (0x600000a9fe38)



--
-- Grid
--

grid = {
  {key="u", presets={
    positions.upper50,
    positions.left50,
    positions.lower50,
    positions.right50}},
  {key="i", presets={
    positions.third_nw,
    positions.third_n,
    positions.third_ne,
    positions.third_w,
    positions.third_c,
    positions.third_e,
    positions.third_sw,
    positions.third_s,
    positions.third_se,
  }},
  {key="o", presets={
    positions.upper50Right50,
    positions.upper50Left50,
    positions.lower50Left50,
    positions.lower50Right50
  }},

  {key="j", presets={positions.left50, positions.left66, positions.left34}},
  {key="k", presets={positions.centered, positions.centered_full_height, positions.maximized}},
  {key="l", presets={positions.right50, positions.right66, positions.right34}},

}

function moveWindowToNextPositionInPreset(presets)
  local screen = hs.screen.mainScreen()
  local window = hs.window.focusedWindow()
  local windowGeo = window:frame()

  local index = 0
  -- check whether the current window location/geo is already defined
  -- if yes, keep the index value
  hs.fnutils.find(presets, function(p)
    index = index + 1

    local geo = hs.geometry.new(p):fromUnitRect(screen:frame()):floor()
    return windowGeo:equals(geo)
  end)
  -- did not find any matching geo, reset index to 0 (later we'll use the first defined geo)
  if index == #presets then index = 0 end

  newPosition = presets[index+1]
  window:moveToUnit(newPosition)
end


-- batch binding
hs.fnutils.each(grid, function(entry)
  bindKey(entry.key, function()
    moveWindowToNextPositionInPreset(entry.presets)
  end)
end)

--
-- modal definitions
--
-- check out https://www.hammerspoon.org/Spoons/ModalMgr.html
-- https://evantravers.com/articles/2020/06/08/hammerspoon-a-better-better-hyper-key/
--
--function modal_key_bindings(leading_key, modal_name, binding_and_functions, parent_modals)
--  --modals['h'] = hs.hotkey.modal.new('cmd-shift-alt-ctrl', 'h')
--  m = hs.hotkey.modal.new('cmd-shift-alt-ctrl', leading_key)
--  if (string.len(modal_name) > 0)
--    function m:entered()
--      hs.alert.show(modal_name)
--    end
--  end
--  --function m:exited()  hs.alert'Mode: none'  end
--  m:bind('', 'escape', function() m:exit() end)
--  m:bind('', 'return', function() m:exit() end)
--  m:bind('',
--    'J', '',function()
--    print'let the record show that J was pressed'
--  end)
--end
--
--modal_key_bindings()

--
-- toggle brightness
--

bindKey("b", function()
  local default = 70
  local brightness  = hs.brightness.get()
  --print(tostring(brightness))
  if brightness == 100 then
    hs.brightness.set(default)
  elseif brightness == default then
    hs.brightness.set(0)
  else
    hs.brightness.set(100)
  end
end)

-- vim: sw=2 ts=2 sts=2 et :
