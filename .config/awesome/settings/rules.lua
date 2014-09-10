local awful     = require("awful")
local beautiful = require("beautiful")

-- {{{ Rules

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,

                    -- Ensure windows never start maiximized
                    maximized_vertical   = false,
                    maximized_horizontal = false,

                     buttons = clientbuttons,
                     size_hints_honor = false } },

    { rule = { class = "MPlayer" },
          properties = { floating = true } },
}

-- }}}
