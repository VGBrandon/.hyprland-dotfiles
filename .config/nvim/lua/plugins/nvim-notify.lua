return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			top_down = false,
			timeout = 200,
		})
	end,
}
