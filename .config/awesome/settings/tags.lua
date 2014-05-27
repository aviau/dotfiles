local awful = require("awful")

layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
}


tags = {
   names = { "WEB", "TERMINAL", "FILES", "CHAT" },  -- default

   layout = {
     layouts[1],
     layouts[2],
     layouts[2],
     layouts[2],
   }
}

for s = 1, screen.count() do
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
