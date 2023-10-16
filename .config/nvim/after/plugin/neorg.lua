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
    -- ["core.ui.calendar"] = {},
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond"
      }
    },                  -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          guthli = "~/kento/cloud/inkbox/notebooks/guthli",
        },
        default_workspace = "guthli"
      },
    },
  },
}
local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  -- Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode("norg", {
    n = {     -- Bind keys in normal mode
      { "<localleader>f", "core.integrations.telescope.find_linkable" },
    },

    i = {     -- Bind in insert mode
      { "<C-f>", "core.integrations.telescope.insert_link" },
      { "<C-l>", "core.integrations.telescope.insert_file_link" },
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
map("n", "<localleader>c", ":Neorg toggle-concealer<CR>")
map("n", "<localleader>p", "gg=G<C-o>zR:%s/ SYLNEWLINE/\\r/g<CR>gg=G<C-o>zR", { desc = "Indent using =" })
