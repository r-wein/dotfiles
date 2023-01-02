local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
	local nls = require("null-ls")
	nls.setup({
		debounce = 150,
		save_after_format = true,
		sources = {
			nls.builtins.formatting.stylua,
			nls.builtins.formatting.eslint_d,
			nls.builtins.formatting.shfmt,
			nls.builtins.diagnostics.markdownlint,
			nls.builtins.formatting.prettierd.with({
				filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
			}),
			nls.builtins.diagnostics.selene.with({
				condition = function(utils)
					return utils.root_has_file({ "selene.toml" })
				end,
			}),
			nls.builtins.formatting.isort,
			nls.builtins.formatting.black,
			nls.builtins.diagnostics.flake8,
		},
		on_attach = options.on_attach,
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".git"),
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
