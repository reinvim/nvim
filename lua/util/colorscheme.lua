local M = {}

M.config = {
	colorscheme = "catppuccin-mocha",
}

function M.set_colorscheme(name)
	M.config.colorscheme = name
	M.load_colorscheme()
end

function M.load_colorscheme()
	M.setup()
end

function M.setup()
	local success, _ = pcall(vim.cmd, "colorscheme " .. M.config.colorscheme)
	if not success then
		vim.notify("Theme does not exist.", vim.log.levels.WARN)
		return
	end

	vim.cmd("colorscheme " .. M.config.colorscheme)
	vim.notify("Theme set to " .. M.config.colorscheme, vim.log.levels.INFO)
end

return M
