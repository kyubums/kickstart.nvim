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
          api.tree.toggle {
            find_file = true,
            update_root = { enable = true },
          }
        end,
        mode = 'n',
        desc = 'NvimTreeFocus',
      },
    }
  end,
  opts = {
    on_attach = on_attach,
  },
}
