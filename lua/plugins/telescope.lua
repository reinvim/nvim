return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (Telescope)" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (Telescope)" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers (Telescope)" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags (Telescope)" })

		local wk = require("which-key")

		wk.add({ { "<leader>f", group = "Telescope", icon = " " } })
	end,
}
