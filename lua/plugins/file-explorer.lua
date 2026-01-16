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
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
		filesystem = {
			use_libuv_file_watcher = false,
			follow_current_file = {
				enabled = true,
			},
		},
		git_status = {
			enabled = false,
		},
		default_component_configs = {
			git_status = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					folder_empty_open = "󰜌",
					default = "",
				},
				symbols = {
					added = "✚",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "󰄲",
					conflict = "",
				},
			},
		},
	},
	keys = {
		{ "<leader>e", ":Neotree toggle<CR>", silent = true, desc = "Open File Explorer." },
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		if vim.fn.argc(-1) == 0 then
			vim.cmd([[Neotree focus]])
		end

		local wk = require("which-key")

		wk.add({ { "<leader>e", icon = "󰙅 " } })
	end,
}
