local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local sylpath = require("utils.sylpath")
local s = ls.snippet
local date = require("utils.date")
local extras = require("luasnip.extras")

local function getFileNameWithoutExtension(snip)
  local fileName = snip.env.TM_FILENAME:match("(.+)%..+$")
  return fileName
end

return {
  s("skull",ls.text_node("󰯈")),
  s(
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
  s(
    {
      trig = "fourpillar",
      name = "Four Pillar questions",
      dscr = "All planning in the start with a todo",
    },
    fmt("Book: {}\n- [ ] Exercise: {}\n- [ ] Tamiation: {}\n- [ ] Hobby: {}\n", {
      ls.i(1),
      ls.i(2),
      ls.i(3),
      ls.i(4),
    })
  ),
  s(
    {
      trig = "sticker",
      name = "journal_sticker",
      dscr = "Put a sticker",
    },
    fmt("![]({}stickers{})\n\n", {
      ls.f(function(_, snip)
        return sylpath.relative_to_syl_root_dir()
      end, {}),
      ls.i(1),
    })
  ),
  s(
    {
      trig = "ln",
      name = "link",
      dscr = "Markdown link",
    },
    fmt("[{}]({})\n\n", {
      ls.i(1),
      ls.i(2),
    })
  ),
  s(
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
  s(
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
  s(
    {
      trig = "selflink",
      name = "self link",
      dscr = "Write the title of file without md in a link",
    },
    fmt("[[{}]]\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
    })
  ),
  s(
    {
      trig = "conclusion",
      name = "conclusion_template",
      dscr = "Conclusion for review of day/week/month/year",
    },
    fmt(
      "## Conclusion for this {}\n\n### Best thing happened this {}?\n\n1. {}\n\n### Worst thing happened this {}?\n\n1. {}\n\n### Things learned?\n\n- {}\n\n### Needs improvment for the next {}\n\n1. {}\n\n",
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
  s(
    {
      trig = "goals",
      name = "goals_template",
      dscr = "Goals for review of day/week/month/year",
    },
    fmt("## Goals for this {}?\n\n- [ ] Plan the {}\n- [ ] {}\n\n## Potential blocks for this {}?\n\n1. {}\n\n", {
      ls.i(1, "sylplaceholder"),
      extras.rep(1),
      ls.i(2),
      extras.rep(1),
      ls.i(3)
    })
  ),

  s(
    {
      trig = "yearly",
      name = "yearly_template",
      dscr = "Create Yearly Template Based on FileName",
    },
    fmt("# {}\n\n[[{}]]  < [[{}]] >  [[{}]]\n\n{}\n---\n\ngoal{}\n\n---\n\n:)\n", {
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
          ds = ds .. '[[' .. d:fmt("%Y-%B") .. '|' .. d:fmt("%B") .. ']] SYLNEWLINE'
          d = d:addmonths(1)
        end
        return ds
      end, {}),

      ls.i(0),
    })
  ),

  s(
    {
      trig = "monthly",
      name = "monthly_template",
      dscr = "Create Monthly Template Based on FileName",
    },
    fmt("# {}\n\n[[{}|{}]]  < [[{}|{}]] >  [[{}|{}]]\n\n{}\n---\n\ngoal{}\n\n---\n[[{}]]\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),

      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:addmonths(-1)
        return d:fmt("%Y-%B")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:addmonths(-1)
        return d:fmt("%B")
      end, {}),

      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%B")
      end, {}),

      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:addmonths(1)
        return d:fmt("%Y-%B")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:addmonths(1)
        return d:fmt("%B")
      end, {}),


      ls.f(function(_, snip)
        local ds = ''
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        for i = 1, 5 do
          ds = ds .. '[[' .. d:fmt("%Y-W%W") .. '|' .. d:fmt("W%W") .. ']] SYLNEWLINE'
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
  ),

  s(
    {
      trig = "weekly",
      name = "weekly_template",
      dscr = "Create Weekly Template Based on FileName",
    },
    fmt("# {}\n\n[[{}|{}]]  < [[{}|{}]] >  [[{}|{}]]\n\n{}\n---\n\ngoal{}\n\n---\n[[{}|{}]] [[{}]]\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(-7)
        return d:fmt("%Y-W%W")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(-7)
        return d:fmt("W%W")
      end, {}),
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("W%W")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(7)
        return d:fmt("%Y-W%W")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(7)
        return d:fmt("W%W")
      end, {}),
      ls.f(function(_, snip)
        local ds = ''
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        for i = 1, 7 do
          ds = ds .. '[[' .. d:setisoweekday(i):fmt("%F") .. '|' .. d:setisoweekday(i):fmt("%A") .. ']] SYLNEWLINE'
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
        return d:fmt("%B")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y")
      end, {}),
    })
  ),

  s(
    {
      trig = "daily",
      name = "daily_template",
      dscr = "Create Daily Template Based on FileName",
    },
    fmt(
      "# {}\n\n[[{}|{}]]  < [[{}|{}]] >  [[{}|{}]]\n\n---\n\n## Tasks\n\n- [ ] {}\n\n---\n[[{}|{}]]  [[{}|{}]] [[{}]]",
      {
        ls.f(function(_, snip)
          local fname = getFileNameWithoutExtension(snip)
          local d = date(fname)
          return fname .. d:fmt(" %A")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          d = d:adddays(-1)
          return d:fmt("%F")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          d = d:adddays(-1)
          return d:fmt("%A")
        end, {}),
        ls.f(function(_, snip)
          return getFileNameWithoutExtension(snip)
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%A")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          d = d:adddays(1)
          return d:fmt("%F")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          d = d:adddays(1)
          return d:fmt("%A")
        end, {}),
        ls.i(0),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y-W%W")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("W%W")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y-%B")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%B")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y")
        end, {}),
      })
  ),

  s(
    {
      trig = "wweekly",
      name = "work_weekly_template",
      dscr = "Create Weekly Work Template Based on FileName",
    },
    fmt("# {}\n\n[[{}|{}]]  < [[{}|{}]] >  [[{}|{}]]\n\n{}\n---\n\ngoal{}\n\n---\n[[{}|{}]] [[{}]]\n", {
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(-7)
        return d:fmt("%Y-W%W")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(-7)
        return d:fmt("W%W")
      end, {}),
      ls.f(function(_, snip)
        return getFileNameWithoutExtension(snip)
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("W%W")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(7)
        return d:fmt("%Y-W%W")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        d = d:adddays(7)
        return d:fmt("W%W")
      end, {}),
      ls.f(function(_, snip)
        local ds = ''
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        for i = 1, 5 do
          ds = ds .. '[[' .. d:setisoweekday(i):fmt("%F") .. '|' .. d:setisoweekday(i):fmt("%A") .. ']] SYLNEWLINE'
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
        return d:fmt("%B")
      end, {}),
      ls.f(function(_, snip)
        local d = date(getFileNameWithoutExtension(snip) .. '-1')
        return d:fmt("%Y")
      end, {}),
    })
  ),

  s(
    {
      trig = "wdaily",
      name = "work_daily_template",
      dscr = "Create Daily Template Based on FileName Work",
    },
    fmt(
      "# {}\n\n[[{}|{}]]  < [[{}|{}]] >  [[{}|{}]]\n\n---\n\n## Tasks\n\n- [ ] {}\n\n---\n[[{}|{}]] [[{}]]",
      {
        ls.f(function(_, snip)
          local fname = getFileNameWithoutExtension(snip)
          local d = date(fname)
          return fname .. d:fmt(" %A")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          if d:getweekday() == 2 then
            d = d:adddays(-3)
          else
            d = d:adddays(-1)
          end
          return d:fmt("%F")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          if d:getweekday() == 2 then
            d = d:adddays(-3)
          else
            d = d:adddays(-1)
          end
          return d:fmt("%A")
        end, {}),
        ls.f(function(_, snip)
          return getFileNameWithoutExtension(snip)
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%A")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          if d:getweekday() == 6 then
            d = d:adddays(3)
          else
            d = d:adddays(1)
          end
          return d:fmt("%F")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          if d:getweekday() == 6 then
            d = d:adddays(3)
          else
            d = d:adddays(1)
          end
          return d:fmt("%A")
        end, {}),
        ls.i(0),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y-%B")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%B")
        end, {}),
        ls.f(function(_, snip)
          local d = date(getFileNameWithoutExtension(snip))
          return d:fmt("%Y")
        end, {}),
      })
  ),

  s(
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
  ),

  s( -- Codeblock {{{
    {
      trig = "codeblock",
      name = "New code block",
      dscr = "Codeblock",
    },
    fmt("```{}\n{}\n```\n", {
      ls.i(1, "Language"),
      ls.i(0),
    })
  ),

  s( -- Codeblock {{{
    {
      trig = "codeblockmake",
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
  ),

  s(
    {
      trig = "wticket",
      name = "Work Ticket",
      dscr = "Write a ticket",
    },
    fmt(
    "## CASN-{} {}\n\n[link](https://accreteai.atlassian.net/browse/CASN-{})\n\n---\n\n",
      {
        ls.i(1),
        ls.i(2),
        extras.rep(1),
      })
  ),
  s(
    {
      trig = "wticket",
      name = "Work Ticket",
      dscr = "Write a ticket",
    },
    fmt(
    "# {}\n___\n\n## Tasks \n- ( ) {}\n\n---\n[link](https://accreteai.atlassian.net/browse/CASN-{})",
      {
        ls.f(function(_, snip)
          return getFileNameWithoutExtension(snip)
        end, {}),
        ls.i(2),
        ls.i(1),
      })
  ),

}
