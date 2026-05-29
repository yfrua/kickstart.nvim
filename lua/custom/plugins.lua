-- Custom plugins
vim.pack.add {
  'https://codeberg.org/andyg/leap.nvim',
  'https://github.com/supermaven-inc/supermaven-nvim',
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/nvim-lua/plenary.nvim',
}

vim.keymap.set({ 'n', 'x', 'o' }, 'e', '<Plug>(leap)')
vim.keymap.set('n', 'E', '<Plug>(leap-from-window)')
require('leap').opts.preview = function(ch0, ch1, ch2) return not (ch1:match '%s' or (ch0:match '%a' and ch1:match '%a' and ch2:match '%a')) end

require('supermaven-nvim').setup {
  color = {
    suggestion_color = '#ffffff',
  },
}

require('neogit').setup {}
vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<cr>', { desc = 'Show [N]eo[G]it UI' })
