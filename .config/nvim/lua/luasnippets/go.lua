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
  s(
    {
      trig = "vl",
      name = "Validate tag",
      dscr = "Add validate tag inside already a tag",
    },
    fmt("validate:\"{}\"", {
      ls.i(1),
    })
  ),
  s(
    {
      trig = "vlr",
      name = "Validate tag required",
      dscr = "Add validate tag inside already a tag",
    },
    ls.text_node("validate:\"required\"")
  ),
}
