local status, telescope = pcall(require, "telescope")
local actions = require("telescope.actions")

if not status then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      n = {
        ["S"] = actions.select_horizontal,
        ["s"] = actions.select_vertical
      }
    }
  }
}
