return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.sonokai_better_performance = 1
		vim.g.sonokai_transparent_background = 1 -- Or true, or "true" for transparency
		vim.g.sonokai_style = "andromeda" -- Optional: choose a style
	end,
}
