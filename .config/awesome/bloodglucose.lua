--[[
     Licensed under GNU General Public License v2
      * (c) 2013,      Luca CPZ
      * (c) 2010-2012, Peter Hofmann
--]]

local helpers  = require("lain.helpers")
local wibox    = require("wibox")
local math     = math
local string   = string
local tostring = tostring
local spawn    = require("awful.spawn")

-- Current blood glucose.

local function factory(args)
    local bloodglucose = { bg = "", widget = wibox.widget.textbox() }
    local args         = args or {}
    local timeout      = args.timeout or 30
    local settings     = args.settings or function() end

    function bloodglucose.update()

        spawn.easy_async_with_shell("/home/aviau/bin/bloodglucose | tr -d '\n'", function (stdout, stderr, reason, exit_code)
            bloodglucose.bg = tonumber(stdout)
        end)

        bg_now = bloodglucose.bg
        widget = bloodglucose.widget
    
        settings()

    end

    helpers.newtimer("bloodglucose", timeout, bloodglucose.update)

    return bloodglucose
end

return factory
