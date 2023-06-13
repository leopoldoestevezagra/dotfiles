local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local fb_actions = require "telescope._extensions.file_browser.actions"

require('telescope').setup {
    pickers = {
        hidden = true
    },
    defaults = {
        mappings = {
            n = {
                ['q'] = actions.close
            }
        }
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hidden = true,
            mappings = {
                ["i"] = {
                    ["<C-h>"] = fb_actions.goto_parent_dir,
                    ["<C-l>"] = actions.select_default,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-y>"] = actions.close
                },
                ["n"] = {
                    ["k"] = fb_actions.goto_parent_dir,
                    ["j"] = actions.select_default,
                    ["<C-y>"] = actions.close
                }
            }
        }
    }
}

vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>dg', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>mr', builtin.marks, {})
vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})

require('telescope').load_extension 'file_browser'

vim.keymap.set('n', '<leader>fs', function ()
    require "telescope".extensions.file_browser.file_browser({
        path = '%:p:h',
        hide_parent_dir = true,
        previewer = false
    })
end, {})

