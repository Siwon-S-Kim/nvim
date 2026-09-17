local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local math = s('mm', {
  t '$',
  i(1),
  t '$',
  i(2),
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'tex', 'typst' }, -- Replace with your filetype (e.g., "javascript", "cpp")
  callback = function()
    vim.keymap.set('i', 'mm', function()
      require('luasnip').snip_expand(math)
    end, { remap = true, buffer = true, desc = 'Math open close' })
  end,
})
