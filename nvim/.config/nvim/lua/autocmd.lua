api = vim.api

-- start terminal in insert mode
-- api.nvim_command("autocmd TermOpen * startinsert") -- OLD
-- api.nvim_create_autocmd("TermOpen", {
-- 	command = "startinsert",
-- })

-- start terminal with no line and relative numbers
-- api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber") -- OLD
api.nvim_create_autocmd("TermOpen", {
	command = "setlocal nonumber norelativenumber nospell",
})

-- set filetype of *.geojson as 'json'
api.nvim_create_augroup("filetype_geojson", { clear = true })
api.nvim_create_autocmd("BufEnter", {
	group = "filetype_geojson",
	pattern = "*.geojson",
	command = "set filetype=json",
})

-- turn on spell checking, wrapping, and hide fold column for text files
local spell_group = api.nvim_create_augroup("enable_spell_check", { clear = true })
api.nvim_create_autocmd("FileType", {
	pattern = { "text", "markdown", "gitcommit", "latex" },
	group = spell_group,
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.foldcolumn = "0"
	end,
})

-- format on write
-- api.nvim_create_augroup("__formatter__", { clear = true })
-- api.nvim_create_autocmd("BufWritePost", {
-- 	group = "__formatter__",
-- 	command = ":FormatWrite",
-- })

-- calls `vim.treesitter.start()` on launch to allow for real-time rainbow-delimiters
-- https://github.com/HiPhish/rainbow-delimiters.nvim/issues/2
-- api.nvim_create_autocmd("VimEnter", { command = "lua vim.treesitter.start()" })
-- HACK: temporary fix to ensure rainbow delimiters are highlighted in real-time
vim.api.nvim_create_autocmd("BufRead", {
	desc = "Ensure treesitter is initialized???",
	callback = function()
		-- if this fails then it means no parser is available for current buffer
		if pcall(vim.treesitter.start) then
			vim.treesitter.start()
		end
	end,
})

-- autocompletion from LSP
api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- set foldexpr to expression if possible
-- https://stackoverflow.com/questions/77220511/neovim-fold-code-with-foldmethod-syntax-or-foldmethod-expr-depending-on-tre
api.nvim_create_autocmd("FileType", {
	callback = function()
		local filetype = vim.bo.filetype

		-- defer setting foldmethod until end of event loop
		-- mainly useful for `foldmethod=syntax` -> before this was
		-- running before syntax was set so no folds were being generated
		vim.schedule(function()
			-- hide foldcolumn on certain buffers
			if filetype == "help" then
				vim.opt_local.foldcolumn = "0"
				return
			end

			if filetype == "html" or filetype == "htmldjango" then
				vim.opt_local.foldmethod = "indent"
			elseif require("nvim-treesitter.parsers").has_parser() then
				-- set foldmethod to expr if treesitter parser available
				vim.opt_local.foldmethod = "expr"
			else
				-- default to syntax
				vim.opt_local.foldmethod = "syntax"
			end
		end)
	end,
})

-- lsp stuff
api.nvim_create_autocmd("LspAttach", {
	callback = function()
		-- keybindings
		vim.keymap.set("n", "grD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
		vim.keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		vim.keymap.set("n", "grs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")

		-- highlighting
		api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = 0,
			command = "lua vim.lsp.buf.document_highlight()",
		})
		api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = 0,
			command = "lua vim.lsp.buf.clear_references()",
		})
	end,
})
