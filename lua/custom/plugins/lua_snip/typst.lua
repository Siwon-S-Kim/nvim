local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local bold = s('**', {
  t '*',
  i(1),
  t '*',
  i(2),
})

local italic = s('__', {
  t '_',
  i(1),
  t '_',
  i(2),
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typst' }, -- Replace with your filetype (e.g., "javascript", "cpp")
  callback = function()
    vim.keymap.set('i', '**', function()
      require('luasnip').snip_expand(bold)
    end, { remap = true, buffer = true, desc = 'Typst bold' })
    vim.keymap.set('i', '__', function()
      require('luasnip').snip_expand(italic)
    end, { remap = true, buffer = true, desc = 'Typst italic' })
  end,
})
