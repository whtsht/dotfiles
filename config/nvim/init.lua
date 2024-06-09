require("user.options")
require("user.plugins")
require("user.mappings")
require("user.lsp")
require("user.cmp")
require("user.autocmd")
if vim.g.neovide then
    require("user.neovide")
end

function ChangeWorkspace()
    require('fzf-lua')
    local handle = io.popen('zoxide query -l')
    if handle == nil then
        return
    end
    local result = handle:read("*a")
    handle:close()

    local dirs = {}
    for line in result:gmatch("[^\r\n]+") do
        table.insert(dirs, line)
    end

    require('fzf-lua').fzf_exec(dirs, {
        prompt = 'z> ',
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
vim.api.nvim_set_keymap('n', '<leader>z', ":lua ChangeWorkspace()<CR>", { noremap = true, silent = true })
