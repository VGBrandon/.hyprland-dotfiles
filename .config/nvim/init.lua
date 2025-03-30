require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neo-tree"),
	require("plugins.colorscheme"),
	require("plugins.transparent"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.autoformatting"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.misc"),
	require("plugins.oil"),
	require("plugins.lazygit"),
	require("plugins.comment-nvim"),
	require("plugins.template-string"),
	require("plugins.noice"),
	require("plugins.virt-column"),
	require("plugins.live-server"),
	require("plugins.flash"),
	require("plugins.nvim-notify"),
	require("plugins.lush"),
	require("plugins.nvim-ts-autotag"),
})
