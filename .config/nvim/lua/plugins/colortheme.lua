--[[ return{
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme('gruvbox-material')
    end
  } ]]

return {
	"RRethy/base16-nvim",
	lazy = false, -- No es lazy-loaded
	priority = 1000, -- Prioridad alta
	config = function()
		-- Aquí no es necesario, pero si quieres aplicar alguna configuración, puedes hacerlo.
		-- Vim no necesita configuraciones especiales para cargar los esquemas de Base16.

		-- Aplicamos el esquema de colores Base16 Ashes
		vim.cmd.colorscheme("base16-ashes")
	end,
}
