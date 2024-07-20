local map = vim.keymap.set
require("neorg").setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.journal"] = {
      config={
        strategy="flat"
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
local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  -- Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode("norg", {
    n = {     -- Bind keys in normal mode
      -- { "<localleader>f", "Telescope neorg find_linkables" }, already there check below
    },

    i = {     -- Bind in insert mode
      { "<C-f>", ":Telescope neorg insert_link<CR>" },
      { "<C-l>", ":Telescope neorg insert_file_link<CR>" },
      { "<S-Enter>", "core.itero.next-iteration" },
    },
  }, {
    silent = true,
    noremap = true,
  })
end)

-- mappings
map("n", "<localleader>y", ":Neorg journal yesterday<CR>")
map("n", "<localleader>u", ":Neorg journal today<CR>")
map("n", "<localleader>o", ":Neorg journal tomorrow<CR>")
map("n", "<localleader>w", ":Neorg workspace")
map("n", "<localleader>f", ":Telescope neorg find_linkable<CR>")
