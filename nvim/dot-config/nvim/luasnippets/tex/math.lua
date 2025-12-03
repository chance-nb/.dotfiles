---@diagnostic disable: undefined-global

local math_mode = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local Msnip = function(trig, nodes)
	return s({ trig = trig, condition = math_mode, wordTrig = false }, nodes)
end
local Mwsnip = function(trig, nodes)
	return s({ trig = trig, condition = math_mode }, nodes)
end

return {
	Mwsnip("unit ms", { t("\\frac{\\text{m}}{\\text{s}}") }),
	Mwsnip("unit mss", { t("\\frac{\\text{m}}{\\text{s}^2}") }),
}, {
	Msnip("t_", { t("_{\\text{"), i(1), t("}}") }),
	Msnip("_", { t("_{"), i(1), t("}") }),
	Msnip("^", { t("^{"), i(1), t("}") }),
	Mwsnip("RR", { t("\\mathbb{R}") }),
	Mwsnip("NN", { t("\\mathbb{N}") }),
	Mwsnip("mbb", { t("\\mathbb{"), i(1), t("}") }),
	Mwsnip("and", { t("\\land ") }),
	Mwsnip("or", { t("\\lor ") }),
}
