---@diagnostic disable: undefined-global

local function in_env(env)
	return function()
		return vim.fn["vimtex#env#is_inside"](env)[1] ~= 0
	end
end

return {
	s(
		"doctemplate",
		fmta(
			[[
			\documentclass[<>, <>pt<>]{<>}
			\usepackage{amsmath}
			\usepackage{amssymb}
			\usepackage[<>]{<>}

			\begin{document}
			<>
			\end{document}
		]],
			{
				i(2, "a4paper"),
				i(3, "12"),
				c(4, { t(""), t(", twocolumn") }),
				i(1, "article"),
				i(6, "T1"),
				i(5, "fontenc"),
				i(0),
			}
		)
	),
	s(
		"letter",
		fmta(
			[[
			\begin{letter}{<>\\<>\\<>}
			\opening{<>}
			<>
			\closing{<>,\\<>}
			\end{letter}
		]],
			{
				i(1, "Name"),
				i(2, "Street"),
				i(3, "City"),
				i(4),
				i(0),
				i(5),
				i(6),
			}
		)
	),
	s(
		{ trig = "usepkg", condition = not math_mode },
		{ t("\\usepackage"), c(2, {
			t(""),
			sn(nil, { t("["), i(1), t("]") }),
		}), t("{"), i(1), t("}") }
	),
	s("emph", { t("\\emph{"), i(1), t("}") }),
	s("italic", { t("\\textit{"), i(1), t("}") }),
	s("sec", { t("\\section{"), i(1), t("}") }),
	s("subsec", { t("\\subsection{"), i(1), t("}") }),
	s("subsubsec", { t("\\subsubsection{"), i(1), t("}") }),
	s("chap", { t("\\chapter{"), i(1), t("}") }),
	s("title", {
		t("\\author{"),
		i(1),
		t({ "}", "\\title{" }),
		i(2),
		t({ "}", "\\date{" }),
		f(function(_)
			return "" .. vim.fn.strftime("%d. %B %Y")
		end, {}),
		t({ "}", "\\maketitle" }),
	}),
}
