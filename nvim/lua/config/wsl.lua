if vim.fn.has('wsl') == 0 then
  return
end

-- Remove Windows directories (/mnt/*) from PATH.
-- Shell command completion scans every PATH entry, and accessing them
-- through drvfs blocks the UI for tens of seconds.
vim.env.PATH = table.concat(
  vim.tbl_filter(function(p)
    return not vim.startswith(p, '/mnt/')
  end, vim.split(vim.env.PATH, ':')),
  ':'
)
