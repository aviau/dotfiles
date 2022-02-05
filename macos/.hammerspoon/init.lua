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
spoon.DiscreteMouseScrolling:start()
