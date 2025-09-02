local global = vim.g
local opt = vim.opt

global.mapleader = " "
global.maplocalleader = " "
global.AutoPairsMultilineClose = 0 -- do NOT JUMP when pressing '}' in insert mode

vim.scriptencoding = "utf-8"
-- vim.cmd.colorscheme('catppuccin-frappe')
-- vim.cmd.colorscheme('catppuccin-macchiato')
-- vim.cmd.colorscheme("desert")
-- vim.cmd.colorscheme("nordfox")
-- vim.cmd.colorscheme("dawnfox")
vim.cmd.colorscheme("fluoromachine")
-- vim.cmd.colorscheme("retrobox")

-- vim.treesitter.start()

vim.opt.spell = false
-- vim.opt.spelllang = { "en_ca" }

opt.number = true -- Print the line number in front of each line
opt.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
opt.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
opt.syntax = "on" -- When this option is set, the syntax with this name is loaded.
opt.autoindent = true -- Copy indent from current line when starting a new line.
opt.cursorline = true -- enabled cursorline highlighting
opt.cursorlineopt = "number" -- highlight only the line number of the cursorline
-- opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
opt.encoding = "utf-8" -- Sets the character encoding used inside Vim.
-- opt.fileencoding = "utf-8" -- Sets the character encoding for the file of this buffer.
opt.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
-- opt.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
opt.mouse = "" -- Disable the use of the mouse
opt.title = true -- When on, the title of the window will be set to the value of 'titlestring'
opt.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
opt.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
opt.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
opt.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
-- opt.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
opt.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
opt.splitbelow = true -- default behaviour of a horizontal split is below the current window
opt.splitright = true -- default behaviour of a vertical split is to the right of the current window
opt.termguicolors = true
opt.wrap = false
opt.linebreak = true
opt.background = "dark"
opt.completeopt = { "menuone", "noselect", "popup" }
opt.foldcolumn = "4"
opt.foldlevel = 8
opt.updatetime = 10 -- updatetime for CursorHold events
opt.signcolumn = "yes:2"
opt.pumheight = 8

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ", -- ✘
			[vim.diagnostic.severity.WARN] = " ", -- ▲
			[vim.diagnostic.severity.HINT] = "⚑ ",
			[vim.diagnostic.severity.INFO] = " ", -- »
		},
	},
	float = {
		border = "rounded",
		source = "always",
	},
})

opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"
