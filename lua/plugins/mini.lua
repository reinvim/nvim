return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function(_, opts)
		-- Notification
		local mini_notify = require("mini.notify")
		mini_notify.setup({
			window = {
				border = "single",
				timeout = 5000,
				winblend = 100,
			},
		})
		vim.notify = MiniNotify.make_notify({ ERROR = { duration = 10000 } })

		local mini_icons = require("mini.icons")
		mini_icons.setup({})

		-- Colors Preview
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		-- Surround
		local mini_surround = require("mini.surround")
		mini_surround.setup({})
	end,
}
