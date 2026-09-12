vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { current_line = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "❗️",
			[vim.diagnostic.severity.WARN] = "⚠️",
			[vim.diagnostic.severity.INFO] = "ℹ️",
			[vim.diagnostic.severity.HINT] = "🔎",
		},
	},
})

-- ==================================================
-- OPTIONS
-- ==================================================

--global
vim.g.mapleader = "," -- leader
vim.opt.clipboard = "unnamedplus" -- share clipboard with host machine

-- scroll and lines
vim.opt.number = true -- display line numbers
vim.opt.relativenumber = true -- line numbers as relative position
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 5 -- at least 5 lines above and bellow screen limit scroll
vim.opt.sidescrolloff = 10 -- at least 10 columns right and left screen limit scroll

-- indentation
vim.opt.tabstop = 4 -- tabwidth
vim.opt.shiftwidth = 4 -- indent width
vim.opt.softtabstop = 4 -- indent width on soft tabs
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- apply smart contextual indent
vim.opt.autoindent = true -- if other rules present copy indent from current line

-- search
vim.opt.ignorecase = true -- case insensitive search by default
vim.opt.smartcase = true -- if search contains upppercase make it case sensitive
vim.opt.hlsearch = false -- do not visually display search matches
vim.opt.incsearch = true -- show matches dinamically as you type

-- visual indications
vim.opt.cursorline = true -- highlight current line
vim.opt.signcolumn = "yes" -- display sign column all the time
vim.opt.showmatch = true -- highlighs matching open/close brackets
vim.opt.cmdheight = 1 -- single line command
vim.opt.showmode = false -- do not display mode in favour of lualine
vim.opt.completeopt = "menuone,noinsert,noselect" -- manual completion selection
vim.opt.fillchars = { eob = " " } -- hinde "~" on empty lines
vim.opt.showtabline = 2 -- always display tabline

-- undo and configs
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then -- create if undo dir not present
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not use backup files
vim.opt.writebackup = false -- do not write backup files
vim.opt.swapfile = false -- do not use swapfiles in favour of undo dirs
vim.opt.undofile = true -- use undofiles
vim.opt.undodir = undodir
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout for completions and async ops
vim.opt.ttimeoutlen = 0 -- key code timeout
vim.opt.autoread = true -- auto detect and auto read changes made outside nvim
vim.opt.autowrite = false -- do not auto save

-- folding
vim.opt.foldmethod = "expr" -- use expresions for folding, not just brackets
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- command for expresion retrieval
vim.opt.foldlevel = 99 -- do not start with folds open

-- splits
vim.opt.splitbelow = true -- horizontal splits go bellow
vim.opt.splitright = true -- vertical splits go right

-- buffers, support and performanc3
vim.opt.hidden = true -- support hidden buffers
vim.opt.errorbells = false -- do not use error sounds
vim.opt.backspace = "indent,eol,start" --backspace behaviour on normal mode
vim.opt.autochdir = false -- do not auto change directories on commands
vim.opt.path:append("**") -- include sub-dirs on search
vim.opt.mouse = "a" -- enable mouse support
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = "UTF-8"
vim.opt.redrawtime = 10000 -- greater neovim redraw
vim.opt.maxmempattern = 20000 -- greater memory

-- ==================================================
-- KEYMAPS
-- ==================================================

-- movement on wrapped lines
vim.keymap.set("n", "j", function() -- overwrite "j" to go one even if wrapped
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

vim.keymap.set("n", "k", function() -- overwrite "k" to go one even if wrapped
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

--search
vim.keymap.set("n", "n", "nzzzv", { desc = "Center to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center to previous search result" })

-- page movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half up down centered" })

-- window movement
vim.keymap.set("n", "<S-h>", "<C-w>h", { desc = "Move to left pane" })
vim.keymap.set("n", "<S-j>", "<C-w>j", { desc = "Move to pane below" })
vim.keymap.set("n", "<S-k>", "<C-w>k", { desc = "Move to pane above" })
vim.keymap.set("n", "<S-l>", "<C-w>l", { desc = "Move to right pane" })

-- window management
vim.keymap.set("n", "sv", ":vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "ss", ":split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "st", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase vertical size of pane" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease vertical size of pane" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease horizontal size of pane" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase horizontal size of pane" })

-- diagnostics
vim.keymap.set("n", "<leader>j", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>k", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })

-- ==================================================
-- AUTOCOMMANDS
-- ==================================================
local augroup = vim.api.nvim_create_augroup("Custom", { clear = true })

vim.api.nvim_create_autocmd("FileType", { -- enable line wrap on markdown files
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

-- ==================================================
-- CUSTOM FUNCTIONS
-- ==================================================

-- custom tabline name resolution
function _G.MyTabline()
	local result = {}
	local current = vim.fn.tabpagenr()
	local tab_count = vim.fn.tabpagenr("$")

	for i = 1, tab_count do
		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)
		local buf = buflist[winnr]

		local name = vim.fn.bufname(buf)
		name = vim.fn.fnamemodify(name, ":t")

		if name == "" then
			name = "[No Name]"
		end

		local square = i == current and "■" or "□"
		local highlight = i == current and "%#TabLineSel#" or "%#TabLine#"

		table.insert(result, string.format("%s %s %d: %s ", highlight, square, i, name))
	end

	table.insert(result, "%#TabLineFill#")

	return table.concat(result)
end

vim.opt.tabline = "%!v:lua.MyTabline()"
