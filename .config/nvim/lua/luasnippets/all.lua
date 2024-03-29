-- Requires {{{
local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local partial = require("luasnip.extras").partial
--}}}

local function rec_ls() --{{{
  return ls.c(1, {
    ls.t({ "" }),
    ls.sn(
      nil,
      fmt("{}{}={}{}", {
        ls.t(" "),
        ls.i(1, "k"),
        ls.i(2, "v"),
        ls.d(3, rec_ls, {}),
      })
    ),
  })
end --}}}

return {
  ls.s( -- Modeline {{{
    { trig = "modeline", dscr = "Add modeline to the file" },
    fmt("vim: {}={}{}", {
      ls.i(1, "k"),
      ls.i(2, "v"),
      ls.d(3, rec_ls, {}),
    })
  ), --}}}

  -- System{{{
  ls.s("time", partial(vim.fn.strftime, "%H:%M:%S")),
  ls.s("date", partial(vim.fn.strftime, "%Y-%m-%d")),
  ls.s("datename", partial(vim.fn.strftime, "%Y-%m-%d %A")),
  --}}}

  -- Misc {{{
  ls.s("shrug", { ls.t("¯\\_(ツ)_/¯") }),
  ls.s("angry", { ls.t("(╯°□°）╯︵ ┻━┻") }),
  ls.s("happy", { ls.t("ヽ(´▽`)/") }),
  ls.s("sad", { ls.t("(－‸ლ)") }),
  ls.s("confused", { ls.t("(｡･ω･｡)") }),
  --}}}
}

-- vim: fdm=marker fdl=0
