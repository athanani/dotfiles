local builtin = require('telescope.builtin')
local telescope = require "telescope"
local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"

telescope.setup {
    defaults = {
        path_display = { "truncate" }
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
        },
        git_files = {
            theme = "dropdown",
            previewer = false,
        },
        live_grep = {
            prompt_title = 'find string in open buffers...',
            grep_open_files = true
        },
        buffers = {
            sort_mru = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                i = { ["<c-d>"] = actions.delete_buffer },
            },
        },
        man_pages = { sections = { "2", "3" } },
        lsp_references = { path_display = { "shorten" } },
        lsp_code_actions = { theme = "dropdown" },
        current_buffer_fuzzy_find = { theme = "dropdown" },
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {noremap = true})
vim.keymap.set('n', '<C-p>', builtin.git_files, {noremap = true})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {noremap = true})
vim.keymap.set('n', '<leader>ss', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {noremap = true})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {noremap = true})
