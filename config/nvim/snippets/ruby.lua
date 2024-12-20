---@diagnostic disable: undefined-global

return {
  s(
    "def",
    fmt(
      [[
    def {}
      {}
    end]],
      {
        i(1, "method_name"),
        i(0),
      }
    )
  ),
  s(
    "defa",
    fmt(
      [[
    def {}({})
      {}
    end]],
      {
        i(1, "method_name"),
        i(2, "args"),
        i(0),
      }
    )
  ),
  s(
    "class",
    fmt(
      [[
      class {}
        {}
      end
      ]],
      {
        i(1, "class_name"),
        i(0),
      }
    )
  ),
}