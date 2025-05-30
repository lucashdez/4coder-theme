local util = require("4coder-theme.util")
local hslutil = require("4coder-theme.hsl")
local hsl = hslutil.hslToHex

local M = {}

---@class Palette
M.default = {
	none = "NONE",

	coder_background = hsl(0, 0, 5),
	coder_margin = hsl(0, 0, 9),
	coder_margin_hover = hsl(0, 0, 15),
	coder_margin_active = hsl(0, 0, 20),
	coder_list_item = { M.coder_margin, M.coder_background },
	coder_list_item_hover = { M.coder_margin_hover, M.coder_margin },
	coder_list_item_active = { M.coder_margin_active, M.coder_margin_active },
	coder_cursor = { active = hsl(120, 100, 47), inactive = hsl(30, 100, 47) },
	coder_at_cursor = hsl(0, 0, 5),
	coder_highlight_cursor_line = hsl(0, 0, 12),
	coder_highlight = hsl(64, 100, 47),
	coder_highlight2 = hsl(64, 100, 30),
	coder_constant = hsl(55, 100, 47),
	coder_types = hsl(55, 100, 47),
	coder_mark = hsl(0, 0, 49),
	coder_text_default = hsl(100, 23, 60),
	coder_at_highlight = hsl(311, 50, 63),
	coder_comment = hsl(208, 87, 53),
	coder_comment_pop = { hsl(120, 100, 31), hsl(0, 100, 31), hsl(50, 100, 40) },
	coder_keyword = hsl(38, 73, 47),
	coder_str_constant = hsl(111, 100, 59),
	coder_str_special = hsl(150, 80, 50),
	coder_char_constant = hsl(111, 100, 59),
	coder_int_constant = hsl(111, 100, 59),
	coder_float_constant = hsl(111, 100, 59),
	coder_bool_constant = hsl(111, 100, 59),
	coder_include = hsl(111, 100, 59),
	coder_preproc = hsl(100, 60, 70),
	coder_special_character = hsl(100, 50, 80),
	coder_ghost_character = hsl(100, 15, 32),
	coder_paste = hsl(64, 100, 47),
	coder_undo = hsl(184, 100, 47),
	coder_highlight_junk = hsl(100, 50, 70),
	coder_highlight_white = hsl(180, 100, 11),
	coder_function = hsl(180, 50, 50),
	coder_bar = hsl(0, 0, 53),
	coder_bar_active = hsl(0, 0, 40),
	coder_base = hsl(0, 0, 0),
	coder_pop1 = hsl(230, 70, 55),
	coder_pop2 = hsl(0, 100, 50),
	coder_line_numbers_bg = hsl(0, 0, 6),
	coder_line_numbers_fg = hsl(0, 0, 25),

	base04 = hsl(192, 100, 5),
	base03 = hsl(192, 100, 11),
	base02 = hsl(192, 81, 14),
	base01 = hsl(194, 14, 40),
	base00 = hsl(196, 13, 45),
	-- base0 = hsl( 186, 8, 55 ),
	base0 = hsl(186, 8, 65),
	-- base1 = hsl( 180, 7, 60 ),
	base1 = hsl(180, 7, 70),
	base2 = hsl(46, 42, 88),
	base3 = hsl(44, 87, 94),
	base4 = hsl(0, 0, 100),
	yellow = hsl(45, 100, 35),
	yellow100 = hsl(47, 100, 80),
	yellow300 = hsl(45, 100, 50),
	yellow500 = hsl(45, 100, 35),
	yellow700 = hsl(45, 100, 20),
	yellow900 = hsl(46, 100, 10),
	orange = hsl(18, 80, 44),
	orange100 = hsl(17, 100, 70),
	orange300 = hsl(17, 94, 51),
	orange500 = hsl(18, 80, 44),
	orange700 = hsl(18, 81, 35),
	orange900 = hsl(18, 80, 20),
	red = hsl(1, 71, 52),
	red100 = hsl(1, 100, 80),
	red300 = hsl(1, 90, 64),
	red500 = hsl(1, 71, 52),
	red700 = hsl(1, 71, 42),
	red900 = hsl(1, 71, 20),
	magenta = hsl(331, 64, 52),
	magenta100 = hsl(331, 100, 73),
	magenta300 = hsl(331, 86, 64),
	magenta500 = hsl(331, 64, 52),
	magenta700 = hsl(331, 64, 42),
	magenta900 = hsl(331, 65, 20),
	violet = hsl(237, 43, 60),
	violet100 = hsl(236, 100, 90),
	violet300 = hsl(237, 69, 77),
	violet500 = hsl(237, 43, 60),
	violet700 = hsl(237, 43, 50),
	violet900 = hsl(237, 42, 25),
	blue = hsl(205, 69, 49),
	blue100 = hsl(205, 100, 83),
	blue300 = hsl(205, 90, 62),
	blue500 = hsl(205, 69, 49),
	blue700 = hsl(205, 70, 35),
	blue900 = hsl(205, 69, 20),
	cyan = hsl(175, 59, 40),
	cyan100 = hsl(176, 100, 86),
	cyan300 = hsl(175, 85, 55),
	cyan500 = hsl(175, 59, 40),
	cyan700 = hsl(182, 59, 25),
	cyan900 = hsl(183, 58, 15),
	green = hsl(68, 100, 30),
	green100 = hsl(90, 100, 84),
	green300 = hsl(76, 100, 49),
	green500 = hsl(68, 100, 30),
	green700 = hsl(68, 100, 20),
	green900 = hsl(68, 100, 10),

	bg = hsl(192, 100, 5),
	bg_highlight = hsl(192, 100, 11),
	fg = hsl(186, 8, 55),
}

---@return ColorScheme
function M.setup(opts)
	opts = opts or {}
	local config = require("4coder-theme.config")

	-- local style = config.is_day() and config.options.light_style or config.options.style
	local style = "default"
	local palette = M[style] or {}
	if type(palette) == "function" then
		palette = palette()
	end

	-- Color Palette
	---@class ColorScheme: Palette
	local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)

	util.bg = colors.bg
	util.day_brightness = config.options.day_brightness

	colors.black = util.darken(colors.bg, 0.8, "#000000")
	colors.border = colors.black

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.base04
	colors.bg_statusline = colors.base03

	-- Sidebar and Floats are configurable
	colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
		or config.options.styles.sidebars == "dark" and colors.base04
		or colors.bg

	colors.bg_float = config.options.styles.floats == "transparent" and colors.none
		or config.options.styles.floats == "dark" and colors.base04
		or colors.bg

	-- colors.fg_float = config.options.styles.floats == "dark" and colors.base01 or colors.fg
	colors.fg_float = colors.fg

	colors.error = colors.red500
	colors.warning = colors.yellow500
	colors.info = colors.blue500
	colors.hint = colors.cyan500

	config.options.on_colors(colors)
	if opts.transform and config.is_day() then
		util.invert_colors(colors)
	end

	return colors
end

return M
