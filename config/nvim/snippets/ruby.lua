---@diagnostic disable: undefined-global

return {
	s(
		"def",
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
}
