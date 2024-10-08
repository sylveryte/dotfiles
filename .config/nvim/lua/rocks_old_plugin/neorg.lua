local map = vim.keymap.set
require("neorg").setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.journal"] = {
      config = {
        strategy = "flat"
      }
    },
    ["core.integrations.telescope"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
        name = "[Neorg]"
      }
    },
    ["core.ui.calendar"] = {},
    ["core.summary"] = {},
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond",
        icons = {
          todo = {
            undone = {
              icon = " ",
            },
          },
          heading = {
            icons = { "◆", "❖", "◈", "◇", "⟡", "⋄" },
          },
          code_block = {
            conceal = true,
            spell_check = false,
            content_only = false,
            width = "content",
            min_width = 85,
          },
        },
      }
    },                  -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          guthli = "~/kento/cloud/inkbox/notebooks/guthli",
          sylbooks = "~/kento/cloud/blueworker/docs/sylbooks",
          magma = "~/kento/cloud/paastry/notebooks/magma",
        },
        default_workspace = "magma"
      },
    },
    ["external.conceal-wrap"] = {},
  },
}


-- mappings

map("i", "<S-Enter>", "<Plug>(neorg.itero.next-iteration)", {})
map("n", "<localleader>y", ":Neorg journal yesterday<CR>")
map("n", "<localleader>u", ":Neorg journal today<CR>")
map("n", "<localleader>o", ":Neorg journal tomorrow<CR>")
map("n", "<localleader>w", ":Neorg workspace")
map("n", "<localleader>f", ":Telescope neorg find_linkable<CR>")
