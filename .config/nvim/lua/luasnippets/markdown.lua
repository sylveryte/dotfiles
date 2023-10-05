local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local date = require("utils.date")

local function getFileNameWithoutExtension(snip)
  local fileName = snip.env.TM_FILENAME:match("(.+)%..+$")
  return fileName
end

return {
  s( -- Link {{{
    {
      trig = "meeting",
      name = "Meeting Template",
      dscr = "Set boiler plate meeting",
    },
    fmt("---\ndate : {}\n---\n\n# {}\n\n## Points\n\n- [ ] {}\n\n\n---\nlink day: [[{}]]", {
      ls.f(function(_, snip)
        return date():fmt("%F %T %A")
      end, {}),
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.i(2),
      ls.i(1),
    })
  ),
  s( -- Link {{{
    {
      trig = "linkproperty",
      name = "Link Property",
      dscr = "Write a label and link a file",
    },
    fmt("{}: [[{}]]\n\n", {
      ls.i(1),
      ls.i(2),
    })
  ),
  s( -- Link {{{
    {
      trig = "fileTitle",
      name = "file title",
      dscr = "Write the title of file without md",
    },
    fmt("# {}\n\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
    })
  ),

  s( -- Link {{{
    {
      trig = "weekly",
      name = "weekly_template",
      dscr = "Create Weekly Template Based on FileName",
    },
    fmt("# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\nWeek:\n{}\n---\n\n## What are the top 3 priorities of the week.\n\n- [ ] {}\n\n---\nMonth: [[{}]]\nYear: [[{}]]\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(-7)
        return d:fmt("%Y-W%W")
      end, {}),
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(7)
        return d:fmt("%Y-W%W")
      end, {}),
      ls.f(function(_, snip)
        local ds = ''
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        for i = 1, 7 do
          ds = ds .. '[[' .. d:setisoweekday(i):fmt("%F %A") .. ']] SYLNEWLINE '
        end
        return ds
      end, {}),
      ls.i(0),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y-%m %B")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y")
      end, {}),
    })
  ), --}}}

  s( -- Link {{{
    {
      trig = "daily",
      name = "daily_template",
      dscr = "Create Daily Template Based on FileName",
    },
    fmt("# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\n---\n\n## Tasks\n\n- [ ] {}\n\n---\nWeek: [[{}]]\nMonth: [[{}]]\nYear: [[{}]]\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip))
        d = d:adddays(-1)
        return d:fmt("%F %A")
      end, {}),
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip))
        d = d:adddays(1)
        return d:fmt("%F %A")
      end, {}),
      ls.i(0),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip))
        return d:fmt("%Y-W%W")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip))
        return d:fmt("%Y-%m %B")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip))
        return d:fmt("%Y")
      end, {}),
    })
  ), --}}}

  s( -- Link {{{
    {
      trig = "daily_work",
      name = "daily_work_template",
      dscr = "Create Daily Template Based on FileName Work",
    },
    fmt("# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\n---\n\n## Tasks\n\n- [ ] {}\n\n---\nSprint: [[{}]]", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip))
        if d:getweekday() == 2 then
          d = d:adddays(-3)
        else
          d = d:adddays(-1)
        end
        return d:fmt("%F %A")
      end, {}),
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip))
        if d:getweekday() == 6 then
          d = d:adddays(3)
        else
          d = d:adddays(1)
        end
        return d:fmt("%F %A")
      end, {}),
      ls.i(0),
      ls.i(1)
    })
  ), --}}}

  s( -- Link {{{
    {
      trig = "link",
      name = "markdown_link",
      dscr = "Create markdown link [txt](url).\nSelect link, press C-s, type link.",
    },
    fmt("[{}]({})\n{}", {
      ls.i(1),
      ls.f(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      ls.i(0),
    })
  ), --}}}

  s( -- Codeblock {{{
    {
      trig = "codeblock",
      name = "Make code block",
      dscr = "Select text, Man press <C-s>, type codeblock.",
    },
    fmt("```{}\n{}\n```\n{}", {
      ls.i(1, "Language"),
      ls.f(function(_, snip)
        local tmp = snip.env.TM_SELECTED_TEXT
        tmp[0] = nil
        return tmp or {}
      end, {}),
      ls.i(0),
    })
  ), --}}}
}
