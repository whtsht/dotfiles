vim.api.nvim_create_augroup("goyo_dynamic", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "VimResized" }, {
  group = "goyo_dynamic",
  callback = function()
    if vim.o.columns > 80 then
      vim.cmd("Goyo 60%x100%")
    else
      vim.cmd("Goyo 80x100%")
    end
  end
})

local function goyo_enter()
  vim.b.quitting = 0
  vim.b.quitting_bang = 0
  vim.api.nvim_create_autocmd("QuitPre", {
    buffer = 0,
    callback = function()
      vim.b.quitting = 1
    end,
  })
  vim.cmd([[
    cabbrev <buffer> q! lua vim.b.quitting_bang = 1 vim.cmd('q!')
  ]])
  vim.o.number = true
  vim.o.relativenumber = true
  vim.cmd([[Limelight]])
end

local function goyo_leave()
  if vim.b.quitting == 1 and #vim.tbl_filter(function(buf)
    return vim.fn.buflisted(buf) == 1
  end, vim.fn.range(1, vim.fn.bufnr('$'))) == 1 then
    if vim.b.quitting_bang == 1 then
      vim.cmd("qa!")
    else
      vim.cmd("qa")
    end
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "GoyoEnter",
  callback = goyo_enter,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "GoyoLeave",
  callback = goyo_leave,
})
