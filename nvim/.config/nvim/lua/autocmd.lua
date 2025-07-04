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

-- turn on spell checking for text files
local spell_group = api.nvim_create_augroup("enable_spell_check", { clear = true })
api.nvim_create_autocmd("FileType", {
	group = spell_group,
	pattern = { "text", "markdown", "gitcommit", "latex" },
	command = "setlocal spell",
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
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

