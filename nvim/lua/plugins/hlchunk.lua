return {
  'shellRaining/hlchunk.nvim',
  config = function()
    require('hlchunk').setup({
      chunk = {
        enable = true,
        duration = 0,
        delay = 0,
      }
    })
  end
}
