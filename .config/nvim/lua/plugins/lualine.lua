local function clock()
	return " " .. os.date("%H:%M")
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { { "SmiteshP/nvim-navic" } },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				icons_enabled = true,
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "lazy" } },
			},
			sections = {
				lualine_a = { { "mode" } },
				lualine_b = { "branch" },
				lualine_c = {
					{ "diagnostics", sources = { "nvim_diagnostic" } },
					{ "filetype", icon_only = true },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = " ", unnamed = " " } },
				},
				lualine_x = {
					{
						function()
							return require("lazy.status").updates()
						end,
						cond = require("lazy.status").has_updates,
						color = { fg = "#f6c177" },
					},
					{
						function()
							local stats = require("lazy").stats()
							local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
							return "" .. ms .. "ms"
						end,
						color = { fg = "#f6c177" },
					},
				},
				lualine_y = { "location" },
				lualine_z = { { clock } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
