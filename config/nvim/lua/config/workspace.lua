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
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local workdir = readFromFile(workdir_file)
    if workdir and vim.fn.isdirectory(workdir) == 1 then
      vim.cmd("cd " .. workdir)
    end
  end,
})
