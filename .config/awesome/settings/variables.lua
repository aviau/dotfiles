-- localization
os.setlocale(os.getenv("LANG"))

-- common
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "xfce4-terminal" or "xterm"
editor     = "vim" or "nano"
editor_cmd = terminal .. " -e " .. editor

-- user defined
browser    = "dwb"
browser2   = "iron"
gui_editor = "gvim"
graphics   = "gimp"
mail       = terminal .. " -e mutt "
