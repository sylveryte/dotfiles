-- Requires {{{
local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local partial = require("luasnip.extras").partial
--}}}

return {

  -- System{{{
  ls.s("time", partial(vim.fn.strftime, "%H:%M:%S")),
  ls.s("date", partial(vim.fn.strftime, "%Y-%m-%d")),
  ls.s("datename", partial(vim.fn.strftime, "%Y-%m-%d %A")),
  --}}}

}

-- vim: fdm=marker fdl=0
