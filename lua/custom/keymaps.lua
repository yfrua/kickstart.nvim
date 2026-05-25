-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<leader>w', '<cmd> w <CR>', { desc = '[W]rite changes to file' })

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without coping into register
vim.keymap.set('n', 'x', '"_x', opts)

-- keep screen center after vertical scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split window [V]ertically' })
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = 'Split window [H]orizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make split windows equal width & height' })
vim.keymap.set('n', '<leader>xs', ':close<CR>', { desc = 'Close current split window' })
vim.keymap.set('n', '<leader>wp', function()
  local window = require('window-picker').pick_window()
  if window then vim.api.nvim_set_current_win(window) end
end, { desc = '[W]indow [P]icker' })

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- open terminal on right
vim.keymap.set("n", "<C-t>", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd L")
  vim.cmd("terminal")
  vim.cmd("vertical resize 80")
end, { desc = "Open [T]erminal on right" })
