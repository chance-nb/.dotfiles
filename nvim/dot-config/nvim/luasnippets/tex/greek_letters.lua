---@diagnostic disable: undefined-global

local math_mode = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local function glt(lhs, rhs)
	return s({ trig = "@" .. lhs, wordTrig = false, condition = math_mode }, { t("\\" .. rhs) })
end

return {}, {
	s({ trig = "pi", condition = math_mode, wordTrig = false }, { t("\\pi") }),
	glt("a", "alpha"),
	glt("A", "Alpha"),
	glt("b", "beta"),
	glt("B", "Beta"),
	glt("d", "delta"),
	glt("D", "Delta"),
	glt("e", "epsilon"),
	glt("E", "Epsilon"),
	glt("g", "gamma"),
	glt("G", "Gamma"),
	glt("o", "omega"),
	glt("O", "Omega"),
	glt("p", "phi"),
	glt("P", "Phi"),
	glt("t", "theta"),
	glt("T", "Theta"),
	glt("r", "rho"),
	glt("R", "Rho"),
}
