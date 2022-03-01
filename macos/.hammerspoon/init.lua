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

function setDiscreteMouseScrolling()
    if hs.mouse.count(true) > 1 then
        print("Enabling DiscreteMouseScrolling...")
        spoon.DiscreteMouseScrolling:start()
    else
        print("Disabling DiscreteMouseScrolling...")
        spoon.DiscreteMouseScrolling:stop()
    end
end

setDiscreteMouseScrolling()

---------------------
-- Battery Watcher --
---------------------
batteryWatcher = hs.battery.watcher.new(function()
    print("Battery state changed.")

    -- Update DiscreteMouseScrolling.
    -- Immediately and in 30 seconds.
    setDiscreteMouseScrolling()
    hs.timer.doAfter(30, function()
        setDiscreteMouseScrolling()
    end)
end)

batteryWatcher:start()

---------------------------
-- Reload from URL event --
---------------------------
hs.urlevent.bind("reload", function()
    print("Reloading...")
    hs.reload()
end)
