return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.add({
			{ "<leader>c", icon = " " },
			{ "<leader>Q", icon = " " },
			{ "<leader>w", icon = " " },
			{ "<leader>h", icon = " " },
			{ "<leader>s", group = "Split", icon = " " },
			{ "<leader>b", group = "Buffers", icon = " " },
			{ "<leader>p", group = "Packages", icon = " " },
			{ "<leader>]", group = "Terminal", icon = " " },
			{ "<leader>[", group = "Jump Up", icon = " " },
			{ "<leader>]", group = "Jump Down", icon = " " },
		})
	end,
}
