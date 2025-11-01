---@diagnostic disable: undefined-global
local function gen_item(args)
	local next = args[1][1] ~= ""
	return sn(nil, next and {
		t({ "", "" }),
		t("	\\item "),
		i(1),
		c(2, { d(nil, gen_item, { 1 }), t("") }),
	} or {})
end
local function list_item(index)
	return sn(index, { t({ "", "" }), t("	\\item "), i(1), c(2, { d(nil, gen_item, { 1 }), t("") }) })
end
local function gen_desc_item(args)
	local next = args[1][1] ~= "" or args[2][1] ~= ""
	return sn(nil, next and {
		t({ "", "" }),
		t("	\\item["),
		i(1),
		t("] "),
		i(2),
		c(3, { d(nil, gen_desc_item, { 1, 2 }), t("") }),
	} or {})
end
local function desc_list_item(index)
	return sn(
		index,
		{ t({ "", "" }), t("	\\item["), i(1), t("] "), i(2), c(3, { d(nil, gen_desc_item, { 1, 2 }), t("") }) }
	)
end

return {
	s("list", {
		t("\\begin{"),
		c(1, { t("enumerate"), t("itemize"), i(nil) }),
		t("}"),
		list_item(2),
		t({ "", "\\end{" }),
		rep(1),
		t("}"),
	}),
	s("ordlist", {
		t({ "\\begin{enumerate}" }),
		list_item(1),
		t({ "", "\\end{enumerate}" }),
	}),
	s("unordlist", {
		t({ "\\begin{itemize}" }),
		list_item(1),
		t({ "", "\\end{itemize}" }),
	}),
	s("desclist", {
		t({ "\\begin{description}" }),
		desc_list_item(1),
		t({ "", "\\end{description}" }),
	}),
}
