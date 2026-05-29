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
  keymaps = {
    accept_suggestion = '<Tab>',
    clear_suggestion = '<esc>',
    accept_word = '<C-j>',
  },
  -- ignore_filetypes = { cpp = true }, -- or { "cpp", }
  color = {
    suggestion_color = '#ffffff',
    cterm = 244,
  },
  log_level = 'info', -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = false, -- disables built in keymaps for more manual control
  condition = function() return false end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
}

require('neogit').setup {}
vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<cr>', { desc = 'Show [N]eo[G]it UI' })
