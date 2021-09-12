local naughty = require("naughty")

local function notify(title, text)
  title = title or ""
  text = text or ""
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = title,
    text = text
  })
end

return {
  notify = notify
}
