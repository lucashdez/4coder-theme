local util = require("4coder-theme.util")
local col = require("4coder-theme.colors")

local M = {}

function M.setup()
	local config = require("4coder-theme.config")
	local options = config.options

	local theme = {
		config = options,
		colors = col.setup(),
	}

	local c = theme.colors
	-- done

	theme.highlights = {
		Comment = { fg = c.coder_comment, style = options.styles.comments },
		ColorColumn = { bg = c.coder_ghost_character },
		Conceal = { fg = c.blue500 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = c.coder_cursor.active, fg = c.coder_background }, --characters under the cursor
		lCursor = { bg = c.coder_cursor.active, fg = c.coder_background }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { bg = c.coder_cursor.active, fg = c.coder_background }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = c.coder_margin_hover }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = c.coder_highlight_cursor_line, sp = c.base0 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	}

	if not vim.diagnostic then
		local severity_map = {
			Error = "Error",
			Warn = "Warning",
			Info = "Information",
			Hint = "Hint",
		}
		local types = { "Default", "VirtualText", "Underline" }
		for _, type in ipairs(types) do
			for snew, iold in pairs(severity_map) do
				theme.highlights["LspDiagnostics" .. type .. sold] = {
					link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
				}
			end
		end
	end

	---@type table<string, table>
	theme.defer = {}

	if options.hide_inactive_statusline then
		local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }

		-- StatusLineNC
		theme.highlights.StatusLineNC = inactive

		-- LuaLine
		for _, section in ipairs({ "a", "b", "c" }) do
			theme.defer["lualine_" .. section .. "_inactive"] = inactive
		end

		-- mini.statusline
		theme.highlights.MiniStatuslineInactive = inactive
	end

	options.on_highlights(theme.highlights, theme.colors)

	if config.is_day() then
		util.invert_colors(theme.colors)
		util.invert_highlights(theme.highlights)
	end

	return theme
end

return M
