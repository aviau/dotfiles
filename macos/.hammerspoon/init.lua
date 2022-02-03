---------------------------------
-- Window Management shortcuts --
---------------------------------
hs.hotkey.bind({"option"}, "F", function()
  -- Toggle Fullscreen
  local win = hs.window.frontmostWindow()
  win:toggleFullScreen()
end)
