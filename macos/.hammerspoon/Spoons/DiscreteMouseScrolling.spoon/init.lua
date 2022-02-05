--- === DiscreteMouseScrolling ===
---
--- Disable mouse scrolling acceleration.
---

local obj={}
obj.__index = obj

-- Metadata
obj.name = "DiscreteMouseScrolling"
obj.version = "0.1"
obj.author = "Alexandre Viau <alexandre@alexandreviau.net>"
obj.homepage = "https://github.com/aviau/dotfiles"
obj.license = "MIT - https://opensource.org/licenses/MIT"

--- Variables
obj.scrollWatcher = nil
obj.scrollDelta = 3

--- DiscreteMouseScrolling:start()
--- Method
--- Starts DiscreteMouseScrolling.
---
--- Parameters:
---  * None
---
--- Returns:
---  * The DiscreteMouseScrolling object.
function obj:start()
    if self.scrollWatcher == nil then
        self.scrollWatcher = hs.eventtap.new(
            {hs.eventtap.event.types.scrollWheel},
            function(event) self:onScroll(event) end
        )
    end
    self.scrollWatcher:start()
    return self
end

--- DiscreteMouseScrolling:stop()
--- Method
--- Stops DiscreteMouseScrolling.
---
--- Parameters:
---  * None
---
--- Returns:
---  * The DiscreteMouseScrolling object.
function obj:stop()
    if self.scrollWatcher ~= nil then
        self.scrollWatcher:stop()
    end
    return self
end

--- Creates a new scroll wheel watcher.
function obj:getScrollWatcher()
    return 
end

--- Handle a scrolling event.
function obj:onScroll(event)
    --- Similar to unnaturalscrollwheels's discrete scrolling.
    local verticalScroll = event:getProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1)

    if verticalScroll > 0 then
        event:setProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1, self.scrollDelta)
    elseif verticalScroll < 0 then
        event:setProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1, -self.scrollDelta)
    end

end

return obj
