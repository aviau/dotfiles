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
hs.loadSpoon("DiscreteMouseScrolling")
if hs.mouse.count() > 1 then
    print("Enabling DiscreteMouseScrolling...")
    spoon.DiscreteMouseScrolling:start()
end

---------------------------
-- Reload from URL event --
---------------------------
hs.urlevent.bind("reload", function()
    print("Reloading...")
    hs.reload()
end)
