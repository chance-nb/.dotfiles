---@diagnostic disable: undefined-global

local function in_env(env)
	return function()
		return vim.fn["vimtex#env#is_inside"](env)[1] ~= 0
	end
end

local function TZwSnip(lhs, rhs)
	return s({ trig = lhs, condition = in_env("tikzpicture"), word_trig = true }, rhs)
end
local function TZSnip(lhs, rhs)
	return s({ trig = lhs, condition = in_env, word_trig = false }, rhs)
end

local function coord(index)
	return sn(index, { t("("), i(1, "0,0"), t(")") })
end

local function coord_preset(index, pre)
	return sn(index, { t("("), i(1, pre), t(")") })
end

return {
	TZwSnip("shade", {
		t("\\shade["),
		i(1, "left"),
		t(" color="),
		i(2, "red"),
		t(","),
		i(3, "right"),
		t(" color="),
		i(4, "blue"),
		t("] "),
	}),
	TZwSnip("draw", {
		t("\\draw"),
		c(1, { t(" "), sn(nil, { t("["), i(1, ""), t("] ") }) }),
		t(" "),
		coord(2),
	}),
	TZwSnip("fill", { t("\\fill["), i(1, "blue!40!white"), t("] "), coord(2) }),
	TZwSnip("rectangle", { t(" rectangle "), coord(2), t(";") }),
	TZwSnip("parabola", { t(" parabola "), coord(2), t(";") }),
	TZwSnip("circle", { t(" circle "), t("("), i(2, "3cm"), t(");") }),
	TZwSnip("ellipse", { t(" circle "), t("("), i(2, "3cm"), t(" and "), i(3, "2cm"), t(");") }),
	TZwSnip("arc", { t(" arc "), t("("), i(2, "0"), t(":"), i(3, "90"), t(":"), i(4, "3cm"), t(");") }),
	TZwSnip("grid", {
		t("\\draw[step="),
		i(1, "0.5cm"),
		i(2, ",gray"),
		t("] "),
		coord_preset(3, "-4,-4"),
		t(" grid "),
		coord_preset(4, "4,4"),
		t(";"),
	}),
	TZwSnip("controls", { t(".. controls "), coord(1), t(" and "), coord(2), t(" .. ") }),
	TZwSnip(
		"sine wave",
		fmta(
			[[
		\begin{scope}[xshift=<>cm,yshift=<>cm] % sine wave
			\def\period{<>}
			\foreach \shift in {0,...,<>} % repetitions (0-indexed)
			{
				\begin{scope}[xshift=\shift*\period cm,xscale=\period]
					\draw (0,0) sin (0.25,1) cos (0.5,0) sin (0.75,-1) cos (1,0);
				\end{scope}
			}
		\end{scope}
		]],
			{ i(1, "0"), i(2, "0"), i(3, "3.14"), i(4, "0") }
		)
	),
	TZwSnip(
		"cosine wave",
		fmta(
			[[
		\begin{scope}[xshift=<>cm,yshift=<>cm] % sine wave
			\def\period{<>}
			\foreach \shift in {0,...,<>} % repetitions (0-indexed)
			{
				\begin{scope}[xshift=\shift*\period cm,xscale=\period]
					\draw (0,0) sin (0.25,1) cos (0.5,0) sin (0.75,-1) cos (1,0);
				\end{scope}
			}
		\end{scope}
		]],
			{ i(1, "0"), i(2, "0"), i(3, "3.14"), i(4, "0") }
		)
	),
}, {
	TZwSnip("cd", { coord(1) }),
	TZwSnip("ln", { t("-- ("), i(1, "0,0"), t(") ") }),
}
