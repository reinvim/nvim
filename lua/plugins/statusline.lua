local conditions = {
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
}
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			-- component_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
				refresh_time = 16, -- ~60fps
				events = {
					"WinEnter",
					"BufEnter",
					"BufWritePost",
					"SessionLoadPost",
					"FileChangedShellPost",
					"VimResized",
					"Filetype",
					"CursorMoved",
					"CursorMovedI",
					"ModeChanged",
				},
			},
		},
		sections = (function()
			local sects = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			}

			local function insert_to_left(component)
				table.insert(sects.lualine_c, component)
			end

			local function insert_to_right(component)
				table.insert(sects.lualine_x, component)
			end

			-- Modes
			local mode_colors = {
				n = { bg = "#fcba03" },
				i = { bg = "#c680ff" },
				v = { bg = "#8be9fd" },
				V = { bg = "#8be9fd" },
				[""] = { bg = "#8be9fd" },
				r = { bg = "#bd93f9" },
				c = { bg = "#44475a" },
				s = { bg = "#f1fa8c" },
				S = { bg = "#f1fa8c" },
				["r?"] = { bg = "#bd93f9" },
				t = { bg = "#50fa7b" },
			}

			insert_to_left({
				function()
					return " "
				end,
				color = function()
					return mode_colors[vim.fn.mode()]
				end,
			})

			-- Filetype
			insert_to_left({ "filetype" })

			-- Filename
			insert_to_left({
				"filename",
				path = 0, -- Shows relative path (0 for just the filename, 1 for relative path, 2 for full path)
				shorting_target = 20, -- Maximum number of characters for the filename before truncating
				symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" }, -- Custom symbols for modified, readonly, unnamed files
			})

			-- Git branches
			insert_to_left({
				"branch",
				icon = " ",
			})

			-- Git diff.
			insert_to_left({
				"diff",
				symbols = { added = " ", modified = "󰝤 ", removed = " " },
				-- diff_color = {
				-- 	added = { fg = colors.success },
				-- 	modified = { fg = colors.warning },
				-- 	removed = { fg = colors.error },
				-- },
				cond = conditions.hide_in_width,
			})

			-- Diagnostics
			insert_to_right({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				-- diagnostics_color = {
				-- 	error = { fg = colors.error },
				-- 	warn = { fg = colors.warning },
				-- 	info = { fg = colors.info },
				-- },
			})

			-- LSP
			insert_to_right({
				function()
					local msg = ""
					local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
					local clients = vim.lsp.get_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							msg = msg .. ", " .. client.name
						end
					end
					return string.sub(msg, 3)
				end,
				icon = " ",
				-- color = { fg = colors.fg },
			})

			-- Progress bar.
			insert_to_right({
				function()
					local current_line = vim.fn.line(".")
					local total_lines = vim.fn.line("$")
					local icons = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }

					local line_ratio = current_line / total_lines

					local index = math.ceil(line_ratio * #icons)

					return icons[index]
				end,
				-- color = {
				-- 	fg = colors.muted,
				-- },
				padding = { left = 1, right = 0 },
			})

			return sects
		end)(),
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
