return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself,
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		event_handlers = {

			{
				event = "file_open_requested",
				handler = function()
					-- auto close
					-- vim.cmd("Neotree close")
					-- OR
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		local keymaps = require("core.keymaps")
		keymaps.normalNR("<leader>e", ":Neotree toggle<CR>", "Open File Explorer.")

		local wk = require("which-key")

		wk.add({ { "<leader>e", icon = "󰙅 " } })
	end,
}
