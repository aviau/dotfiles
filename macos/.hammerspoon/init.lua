---------------------------------
-- Window Management shortcuts --
---------------------------------
hs.hotkey.bind({"option"}, "F", function()
    -- Toggle Fullscreen
    local win = hs.window.frontmostWindow()
    win:toggleFullScreen()
end)

------------------------------
-- Discrete Mouse Scrolling --
------------------------------
local scrollWatcher = hs.eventtap.new({hs.eventtap.event.types.scrollWheel}, function(event)
    -- Similar to unnaturalscrollwheels's discrete scrolling.
    local verticalScroll = event:getProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1)

    if verticalScroll > 0 then
        event:setProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1, 3)
    elseif verticalScroll < 0 then
        event:setProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1, -3)
    end

end)
scrollWatcher:start()
