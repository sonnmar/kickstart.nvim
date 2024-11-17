-- [Basic Settings] --

-- spell checking
vim.opt.spelllang = 'de_de,en'
vim.opt.spell = true

-- [Basic Keymaps] --

-- switch between and close buffers
vim.keymap.set('n', 'ä', '<cmd>bn<CR>')
vim.keymap.set('n', 'ö', '<cmd>bp<CR>')
vim.keymap.set('n', 'ü', '<cmd>bd<CR>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [autocmd] --

-- au group for filetype specific settings
local id_filetype = vim.api.nvim_create_augroup('CustomFiletype', {
  clear = true,
})

-- markdown- and tex-files: set hard word wraping and text conceal
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'tex', 'text' },
  callback = function()
    vim.o.wrap = true
    vim.o.linebreak = true
    vim.o.breakindent = true
    vim.o.breakindentopt = 'list:2'
    vim.opt.conceallevel = 0
  end,
  group = id_filetype,
})

-- different indentwidth for lua-files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua' },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end,
  group = id_filetype,
})
