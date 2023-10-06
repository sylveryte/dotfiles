local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local date = require("utils.date")
local extras = require("luasnip.extras")

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
        return date():fmt("%F-%T-%A")
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
      trig = "conclusion",
      name = "conclusion_template",
      dscr = "Conclusion for review of day/week/month/year",
    },
    fmt(
    "## Conclusion for this {}. \n\n### Best thing happened this {}?\n\n1. {}\n\n### Worst thing happened this {}?\n\n1. {}\n\n### Things learned?\n\n- {}\n\n### Needs improvment for next {}.\n\n1. {}\n\n",
      {
        ls.i(1, "sylplaceholder"),
        extras.rep(1),
        ls.i(2),
        extras.rep(1),
        ls.i(3),
        ls.i(4),
        extras.rep(1),
        ls.i(5),
      })
  ),
  s( -- Link {{{
    {
      trig = "goals",
      name = "goals_template",
      dscr = "Goals for review of day/week/month/year",
    },
    fmt("## Goals for this {}?\n\n- [ ] {}\n\n## Potential blocks for this {}?\n\n1. {}\n\n", {
      ls.i(1, "sylplaceholder"),
      ls.i(2),
      extras.rep(1),
      ls.i(3)
    })
  ),

  s( -- Link {{{
    {
      trig = "yearly",
      name = "yearly_template",
      dscr = "Create Yearly Template Based on FileName",
    },
    fmt("# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\nYear:\n{}\n---\n\ngoal{}\n\n---\n\n:)\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),

      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1-1')
        d = d:addyears(-1)
        return d:fmt("%Y")
      end, {}),

      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),

      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1-1')
        d = d:addyears(1)
        return d:fmt("%Y")
      end, {}),

      ls.f(function(_, snip)
        local ds = ''
        local d = date(getFileNameWithoutExtension(snip) .. '-1-1')
        for i = 1, 12 do
          ds = ds .. '[[' .. d:fmt("%Y-%B") .. ']] SYLNEWLINE'
          d = d:addmonths(1)
        end
        return ds
      end, {}),

      ls.i(0),
    })
  ), --}}}

  s( -- Link {{{
    {
      trig = "monthly",
      name = "monthly_template",
      dscr = "Create Monthly Template Based on FileName",
    },
    fmt("# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\nMonth:\n{}\n---\n\ngoal{}\n\n---\nYear: [[{}]]\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),

      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:addmonths(-1)
        return d:fmt("%Y-%B")
      end, {}),

      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),

      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:addmonths(1)
        return d:fmt("%Y-%B")
      end, {}),

      ls.f(function(_, snip)
        local ds = ''
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        for i = 1, 5 do
          ds = ds .. '[[' .. d:fmt("%Y-W%W") .. ']] SYLNEWLINE'
          d = d:adddays(7)
        end
        return ds
      end, {}),

      ls.i(0),

      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y")
      end, {}),
    })
  ), --}}}

  s( -- Link {{{
    {
      trig = "weekly",
      name = "weekly_template",
      dscr = "Create Weekly Template Based on FileName",
    },
    fmt("# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\nWeek:\n{}\n---\n\ngoal{}\n\n---\nMonth: [[{}]]\nYear: [[{}]]\n", {
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
          ds = ds .. '[[' .. d:setisoweekday(i):fmt("%F-%A") .. ']] SYLNEWLINE'
        end
        return ds
      end, {}),
      ls.i(0),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y-%B")
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
    fmt(
      "# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\n---\ngoal{}\n---\nWeek: [[{}]]\nMonth: [[{}]]\nYear: [[{}]]\n",
      {
        ls.f(function(_, snip)
          return getFileNameWithoutExtension(snip)
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          d = d:adddays(-1)
          return d:fmt("%F-%A")
        end, {}),
        ls.f(function(_, snip)
          return getFileNameWithoutExtension(snip)
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          d = d:adddays(1)
          return d:fmt("%F-%A")
        end, {}),
        ls.i(0),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y-W%W")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y-%B")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y")
        end, {}),
      })
  ), --}}}

  s( -- Link {{{
    {
      trig = "wweekly",
      name = "work_weekly_template",
      dscr = "Create Weekly Work Template Based on FileName",
    },
    fmt("# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\nWeek:\n{}\n---\n\ngoal{}\n\n---\nMonth: [[{}]]\nYear: [[{}]]\n", {
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
        for i = 1, 5 do
          ds = ds .. '[[' .. d:setisoweekday(i):fmt("%F-%A") .. ']] SYLNEWLINE'
        end
        return ds
      end, {}),
      ls.i(0),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y-%B")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y")
      end, {}),
    })
  ), --}}}

  s( -- Link {{{
    {
      trig = "wdaily",
      name = "work_daily_template",
      dscr = "Create Daily Template Based on FileName Work",
    },
    fmt(
    "# {}\n\n[[{}]]  <== [[{}]] ==>  [[{}]]\n\n---\n\n## Tasks\n\n- [ ] {}\n\n---\nSprint: [[{}]]\nWeek: [[{}]]\nMonth: [[{}]]\nYear: [[{}]]",
      {
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
          return d:fmt("%F-%A")
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
          return d:fmt("%F-%A")
        end, {}),
        ls.i(0),
        ls.i(1),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y-W%W")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y-%B")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y")
        end, {}),
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

