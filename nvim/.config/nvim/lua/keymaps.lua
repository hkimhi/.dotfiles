-- use 'esc' to exit insert mode in terminal
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- use fb to enter file browser
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<C-Space>",
-- 	"<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
-- 	{ noremap = true }
-- )
vim.keymap.set("n", "<C-Space>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>da", builtin.diagnostics, { silent = true, desc = "List diagnostics in all buffers" })
vim.keymap.set("n", "<leader>dd", function()
	builtin.diagnostics({ bufnr = 0 })
end, { silent = true, desc = "List diagnostics in current buffer" })

-- use CTRL+h to enter undotree
-- vim.keymap.set("n", "<C-h>", vim.cmd.UndotreeToggle)

-- use <leader>f to format current buffer
-- vim.keymap.set("n", "<leader>f", ":Format<CR>", { silent = true })
-- use <leader>F to format and write current buffer
-- vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>", { silent = true })

-- use <leader>h to open diagnostic float
vim.keymap.set("n", "<leader>h", ":lua vim.diagnostic.open_float()<CR>", { silent = true })

-- use <C-/> to toggle line comment
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, silent = true })

-- https://github.com/kovidgoyal/kitty/discussions/5554
-- kitty terminal doesn't recognize <C-_>, needs <C-/>
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, silent = true })

-- don't copy text when deleting by throwing it all into the black hole register ("_)
-- vim.keymap.set("n", "d", '"_d', { remap = false, silent = true })
-- vim.keymap.set("v", "d", '"_d', { remap = false, silent = true })

vim.keymap.set("n", "<leader>l", ":lua ToggleVirtualLines()<CR>", { silent = true, desc = "Toggle virtual lines" })
vim.keymap.set("n", "<leader>;", ":lua ToggleVirtualText()<CR>", { silent = true, desc = "Toggle virtual text" })

function ToggleVirtualText()
	local current_state = vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = not current_state })
end

function ToggleVirtualLines()
	local current_state = vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_lines = not current_state })
end

vim.keymap.set("n", "<leader>r", ":RenderMarkdown toggle<CR>", { silent = true, desc = "Toggle markdown rendering" })
