return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            local function telescope_mappings(_, map)
                map("i", "<C-t>", actions.select_tab)
                map("i", "<C-s>", actions.select_horizontal)
                map("i", "<C-v>", actions.select_vertical)

                map("n", "<C-t>", actions.select_tab)
                map("n", "<C-s>", actions.select_horizontal)
                map("n", "<C-v>", actions.select_vertical)


                return true
            end

            local function telescope_buffer_picker_mappings(_, map)
                map("i", "<C-t>", actions.select_tab)
                map("i", "<C-s>", actions.select_horizontal)
                map("i", "<C-v>", actions.select_vertical)

                map("n", "<C-t>", actions.select_tab)
                map("n", "<C-s>", actions.select_horizontal)
                map("n", "<C-v>", actions.select_vertical)

                map("n", "<C-d>", actions.delete_buffer)
                map("i", "<C-d>", actions.delete_buffer)

                return true
            end

            vim.keymap.set("n", "<leader>fa", function()
                builtin.find_files({
                    attach_mappings = telescope_mappings,
                })
            end, { desc = "Telescope find files" })

            vim.keymap.set("n", "<leader>fg", function()
                builtin.live_grep({
                    attach_mappings = telescope_mappings,
                })
            end, { desc = "Telescope live grep" })

            vim.keymap.set("n", "<leader>fb", function()
                builtin.buffers({
                    attach_mappings = telescope_buffer_picker_mappings,
                })
            end, { desc = "Telescope buffers" })

            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
                desc = "Telescope help tags",
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
