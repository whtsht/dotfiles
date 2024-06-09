require("user.options")
require("user.plugins")
require("user.mappings")
require("user.lsp")
require("user.cmp")
require("user.autocmd")
if vim.g.neovide then
    require("user.neovide")
end

-- Function to change directory using zoxide and fzf-lua
function ChangeDirectory()
    require('fzf-lua')
    local handle = io.popen('zoxide query -l')
    local result = handle:read("*a")
    handle:close()

    local dirs = {}
    for line in result:gmatch("[^\r\n]+") do
        table.insert(dirs, line)
    end

    require('fzf-lua').fzf_exec(dirs, {
        prompt = 'zoxide directories> ',
        actions = {
            ['default'] = function(selected)
                local dir = selected[1]
                if dir then
                    vim.cmd('cd ' .. dir)
                end
            end
        }
    })
end

-- Map the function to a keybinding
vim.api.nvim_set_keymap('n', '<leader>z', ":lua ChangeDirectory()<CR>", { noremap = true, silent = true })
