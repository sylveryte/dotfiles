local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local f = ls.function_node

return {
  s(
    {
      trig = "cn",
      name = "className",
      dscr = "className",
    },
    fmt("className=\"{}\"", {
      ls.i(1),
    })
  ),
  s(
    {
      trig = "oc",
      name = "onClick",
      dscr = "onClick",
    },
    fmt("onClick={{()=>{})}}", {
      ls.i(1),
    })
  ),
}
