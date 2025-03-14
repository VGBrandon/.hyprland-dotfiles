return {
	{
		"sainnhe/gruvbox-material",
		lazy = true,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			--vim.g.gruvbox_material_enable_italic = true
			--vim.cmd.colorscheme('gruvbox-material')
		end,
	},

	{
		"RRethy/base16-nvim",
		lazy = true, -- No es lazy-loaded
		priority = 1000, -- Prioridad alta
		config = function()
			-- Aquí no es necesario, pero si quieres aplicar alguna configuración, puedes hacerlo.
			-- Vim no necesita configuraciones especiales para cargar los esquemas de Base16.

			-- Aplicamos el esquema de colores Base16 Ashes
			-- vim.cmd.colorscheme("base16-ashes")
		end,
	},

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
			--vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				-- Your config here
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
