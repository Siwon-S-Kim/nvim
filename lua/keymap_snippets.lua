local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local parenthese = s('parenthese', {
  t '(',
  i(1),
  t ')',
  i(2),
})
local brackets = s('brackets', {
  t '[',
  i(1),
  t ']',
  i(2),
})
local braces = s('braces', {
  t '{',
  i(1),
  t '}',
  i(2),
})
local quote = s('quote', {
  t "'",
  i(1),
  t "'",
  i(2),
})
local dquote = s('dquote', {
  t '"',
  i(1),
  t '"',
  i(2),
})
vim.keymap.set('i', '()', function()
  require('luasnip').snip_expand(parenthese)
end, { remap = true })
vim.keymap.set('i', '{}', function()
  require('luasnip').snip_expand(braces)
end, { remap = true })
vim.keymap.set('i', '[]', function()
  require('luasnip').snip_expand(brackets)
end, { remap = true })
vim.keymap.set('i', '""', function()
  require('luasnip').snip_expand(dquote)
end, { remap = true })
vim.keymap.set('i', "''", function()
  require('luasnip').snip_expand(quote)
end, { remap = true })
