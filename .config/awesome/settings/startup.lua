-- {{{ Run once function

local awful = require("awful")

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

-- }}}


-- {{{ Autostart applications

run_once("xscreensaver -no-splash")
run_once("nm-applet")
run_once("insync start")
run_once("guake")
run_once("sy gui")

-- Switch caps lock and escape
run_once("xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'")
--  run_once("xmodmap -e 'keycode 9 = Caps_Lock NoSymbol Caps_Lock'")

-- }}}
