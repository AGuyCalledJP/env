stackline = require "stackline"
stackline:init()
stackline.config:toggle('appearance.showIcons')

hs.hotkey.bind({"alt", "shift"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
