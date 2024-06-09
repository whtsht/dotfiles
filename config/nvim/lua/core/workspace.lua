function ChangeWorkspace()
  require("fzf-lua")
  local handle = io.popen("zoxide query -l")
  if handle == nil then
    return
  end
  local result = handle:read("*a")
  handle:close()

  local dirs = {}
  for line in result:gmatch("[^\r\n]+") do
    table.insert(dirs, line)
  end

  require("fzf-lua").fzf_exec(dirs, {
    prompt = "z> ",
    actions = {
      ["default"] = function(selected)
        local dir = selected[1]
        if dir then
          vim.cmd("cd " .. dir)
        end
      end
    }
  })
end

local workdir_file = vim.fn.stdpath("data") .. "/last_working_dir"

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local workdir = vim.fn.getcwd()
    local f = io.open(workdir_file, "w")
    if f then
      f:write(workdir)
      f:close()
    end
  end
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local f = io.open(workdir_file, "r")
    if f then
      local workdir = f:read("*line")
      f:close()
      if workdir and vim.fn.isdirectory(workdir) == 1 then
        vim.cmd("cd " .. workdir)
      end
    end
  end
})
