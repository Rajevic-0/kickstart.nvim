-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    default_component_configs = {
      icon = {
        provider = function(icon, node)
          local mini_icons = require("mini.icons")

          if node.type == "directory" then
            icon.text = node:is_expanded() and "" or ""
            icon.highlight = "Directory"
          else
            local glyph, hl = mini_icons.get("file", node.name)
            icon.text = glyph or icon.text
            icon.highlight = hl or icon.highlight
          end
        end,
      }
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
