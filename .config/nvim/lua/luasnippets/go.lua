local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local f = ls.function_node

return {
  s(
    {
      trig = "js",
      name = "JSON tag",
      dscr = "Add json tag",
    },
    fmt("`json:\"{}\"`", {
      ls.i(1),
    })
  ),
}
