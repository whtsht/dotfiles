function ChangeWorkspace()
  local handle = io.popen("find ~ -maxdepth 6 -type d -not -path '*/.*' -print")
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

local function writeToFile(filename, content)
  local f = io.open(filename, "w")
  if f then
    f:write(content)
    f:close()
  end
end

local function readFromFile(filename)
  local f = io.open(filename, "r")
  if f then
    local content = f:read("*line")
    f:close()
    return content
  end
  return nil
end

local workdir_file = vim.fn.stdpath("data") .. "/last_working_dir"

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local workdir = vim.fn.getcwd()
    writeToFile(workdir_file, workdir)
  end
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local workdir = readFromFile(workdir_file)
    if workdir and vim.fn.isdirectory(workdir) == 1 then
      vim.cmd("cd " .. workdir)
    end

    vim.defer_fn(function()
      vim.cmd("e #<1")
    end, 100)
  end
})
