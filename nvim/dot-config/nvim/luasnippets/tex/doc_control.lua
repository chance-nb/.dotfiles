---@diagnostic disable: undefined-global

local function in_env(env)
	return function()
		return vim.fn["vimtex#env#is_inside"](env)[1] ~= 0
	end
end

return {
	s(
		"doctemp",
		fmta(
			[[
			\documentclass[<>]{<>}
			\usepackage{amsmath}
			\usepackage{amssymb}
			\usepackage[<>]{<>}

			\begin{document}
			<>
			\end{document}
		]],
			{ i(2, "a4paper"), i(1, "article"), i(4, "T1"), i(3, "fontenc"), i(0) }
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
