hs.hotkey.bind({"option"}, "F", function()
  local win = hs.window.frontmostWindow()
  win:toggleFullScreen()
end)
