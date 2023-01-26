local Rule = require('nvim-autopairs.rule')
local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then
  return
end
autopairs.setup()
autopairs.add_rule(Rule('$$', '$$', 'tex'))
