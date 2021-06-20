local action_state = require('telescope.actions.state') --folder.folder.file
require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
        set_env = {['COLORTERM'] = 'truecolor'},
        file_previewer = require'telescope.previewers'.vim_buffer_cat.net,
        mappings = {
            i = {
                ["<C-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
