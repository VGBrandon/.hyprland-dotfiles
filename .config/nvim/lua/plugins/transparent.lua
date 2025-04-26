return {
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		priority = 2000,
		config = function()
			require("transparent").setup({
				extra_groups = {
					"neotreenormal",
					"neotreenormalnc",
					"neotreesigncolumn",
					"neotreeendofbuffer",
					"bufferlinebackground",
				},
			})
		end,
	},
}
