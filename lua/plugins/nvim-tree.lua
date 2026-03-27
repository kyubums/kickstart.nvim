local function on_attach(bufnr)
  local api = require 'nvim-tree.api'

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'l', api.node.open.edit, { desc = 'open', buffer = bufnr })
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, { desc = 'open', buffer = bufnr })
end

return {
  'nvim-tree/nvim-tree.lua',
  keys = function()
    local api = require 'nvim-tree.api'

    return {
      {
        '<leader>e',
        function()
          api.tree.toggle()
        end,
        mode = 'n',
        desc = 'NvimTreeFocus',
      },
      {
        '<leader>E',
        function()
          api.tree.focus()
        end,
        mode = 'n',
        desc = 'NvimTreeFocus',
      },
    }
  end,
  ---@type nvim_tree.config
  opts = {
    update_focused_file = {
      enable = true,
    },
    view = {
      preserve_window_proportions = true,
      width = {
        max = 100,
      }
    },
    actions = {
      open_file = {
        resize_window = false,
      },
    },
    on_attach = on_attach,
  },
}
