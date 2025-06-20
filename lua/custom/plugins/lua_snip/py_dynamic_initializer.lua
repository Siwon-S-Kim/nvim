local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require('luasnip.extras.fmt').fmt

-- see latex infinite list for the idea. Allows to keep adding arguments via choice nodes.
local function py_init()
  return sn(
    nil,
    c(1, {
      t '',
      sn(1, {
        t ', ',
        i(1),
        d(2, py_init),
      }),
    })
  )
end

-- splits the string of the comma separated argument list into the arguments
-- and returns the text-/insert- or restore-nodes
local function to_init_assign(args)
  local tab = {}
  local a = args[1][1]
  if #a == 0 then
    table.insert(tab, t { '', '\tpass' })
  else
    local cnt = 1
    for e in string.gmatch(a, ' ?([^,]*) ?') do
      if #e > 0 then
        local arg_string = ''
        local type_string = ''
        local type_count = 0
        for type_split in string.gmatch(e, ' ?([^:]*) ?') do
          local default_count = 0
          for default_split in string.gmatch(type_split, ' ?([^=]*) ?') do
            if default_count == 0 then
              if type_count == 0 then
                arg_string = default_split
              elseif type_count == 2 then
                -- I don't know why type_count == 2 matches with second element of split but well wasted too much time
                type_string = default_split
              end
            end
            default_count = default_count + 1
          end
          type_count = type_count + 1
        end
        table.insert(tab, t { '', '\tself.' })
        -- use a restore-node to be able to keep the possibly changed attribute name
        -- (otherwise this function would always restore the default, even if the user
        -- changed the name)
        table.insert(tab, r(cnt, tostring(cnt), i(nil, arg_string)))
        if #type_string > 0 then
          table.insert(tab, t ' : ')
          table.insert(tab, t(type_string))
        end
        table.insert(tab, t ' = ')
        table.insert(tab, t(arg_string))
        cnt = cnt + 1
      end
    end
  end
  return sn(nil, tab)
end

-- create the actual snippet
ls.add_snippets('python', {
  s(
    'pyinit',
    fmt([[def __init__(self{}):{}]], {
      d(1, py_init),
      d(2, to_init_assign, { 1 }),
    })
  ),
})
