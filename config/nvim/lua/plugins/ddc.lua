local function patch_global(option_name, value)
  vim.fn['ddc#custom#patch_global'](option_name, value)
end

patch_global('ui', 'native')

patch_global('sources', {
  'file',
  'around'
})

patch_global('sourceOptions', {
  _ = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_fuzzy'},
    converters = {'converter_fuzzy'},
    minAutoCompleteLength = 1,
  },
  around = {
    mark = 'A',
  },
  file = {
    mark = 'F',
    isVolatile = true,
    forceCompletionPattern = '\\S/\\S*',
  },
})

vim.call('ddc#enable')
