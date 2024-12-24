local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    { import = "config.plugins" },
	},
	change_detection = {
		enabled = false,
		notify = false,
  },
  { ui = { icons = vim.g.have_nerd_font and {} } },
})

-- vim: ts=2 sts=2 sw=2 et