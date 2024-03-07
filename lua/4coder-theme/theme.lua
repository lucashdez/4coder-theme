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
		NCursor = { bg = c.coder_cursor.inactive, fg = c.coder_background },
		lCursor = { bg = c.coder_cursor.active, fg = c.coder_background }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { bg = c.coder_cursor.active, fg = c.coder_background }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = c.coder_margin_hover }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = c.coder_highlight_cursor_line, sp = c.base0 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = c.blue500 }, -- directory names (and other special names in listings)
		DiffAdd = { fg = c.green500, bg = c.base02, bold = true }, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = c.yellow500, bg = c.base02, bold = true }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { fg = c.red500, bg = c.base02, bold = true }, -- diff mode: Deleted line |diff.txt|
		DiffText = { fg = c.blue500, bg = c.base02, bold = true }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = c.base01 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = c.red500, reverse = true }, -- error messages on the command line
		VertSplit = { fg = c.coder_margin_active }, -- the column separating vertically split windows
		WinSeparator = { fg = c.coder_margin_active, bold = true }, -- the column separating vertically split windows
		Folded = { fg = c.coder_text_default, bg = c.coder_margin_hover, bold = true }, -- line used for closed folds
		FoldColumn = { fg = c.coder_margin_hover }, -- 'foldcolumn'
		SignColumn = { fg = c.coder_margin_hover }, -- column where |signs| are displayed
		SignColumnSB = { fg = c.coder_margin_hover }, -- column where |signs| are displayed
		Substitute = { fg = c.coder_margin, bg = c.coder_highlight }, -- |:substitute| replacement text highlighting
		LineNr = { fg = c.coder_line_numbers_fg, bg = options.transparent and c.none or c.coder_line_numbers_bg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = c.coder_line_numbers_fg, sp = c.coder_highlight_cursor_line }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { fg = c.red100, bg = c.red500, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = c.blue500 }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = c.coder_margin_active }, -- Area for messages and cmdline
		MoreMsg = { fg = c.blue500 }, -- |more-prompt|
		NonText = { fg = c.coder_mark, bold = true }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = c.coder_text_default, bg = options.transparent and c.none or c.coder_background }, -- normal text
		NormalNC = { fg = c.coder_text_default, bg = options.transparent and c.none or c.coder_background }, -- normal text in non-current windows
		NormalSB = { fg = c.coder_text_default, bg = c.coder_background }, -- normal text in sidebar
		NormalFloat = { fg = c.coder_text_default, bg = c.coder_background }, -- Normal text in floating windows.
		FloatBorder = { fg = c.coder_margin_active, bg = c.coder_background },
		FloatTitle = { fg = c.coder_text_default, bg = c.coder_background },
		Pmenu = { fg = c.coder_text_default, bg = c.coder_background }, -- Popup menu: normal item.
		PmenuSel = { fg = c.coder_text_default, bg = c.coder_highlight_cursor_line }, -- Popup menu: selected item.
		PmenuSbar = { fg = c.coder_bar }, -- Popup menu: scrollbar.
		PmenuThumb = { fg = c.coder_bar_active }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = c.coder_pop1, bold = true }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = c.coder_pop1, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { fg = c.coder_highlight2, reverse = true }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { fg = c.coder_highlight, standout = true }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = "IncSearch" },

		SpecialKey = { fg = c.base00 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = c.red500, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = c.violet500, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = c.cyan500, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = c.yellow500, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = c.coder_text_default, bg = c.coder_margin_active }, -- status line of current window
		StatusLineNC = { fg = c.coder_text_default, bg = c.coder_margin_hover }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { fg = c.coder_text_default, bg = c.coder_background, sp = c.coder_background }, -- tab pages line, not active tab page label
		TabLineFill = { fg = c.coder_margin_active, bg = c.coder_margin_hover }, -- tab pages line, where there are no labels
		TabLineSel = { fg = c.coder_highlight, bg = c.coder_background }, -- tab pages line, active tab page label
		Title = { fg = c.orange500, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = c.coder_margin_active }, -- Visual mode selection
		VisualNOS = { bg = c.coder_margin_active }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = c.orange500, bold = true }, -- warning messages
		Whitespace = { fg = c.coder_mark }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { fg = c.base2, bg = c.base02, reverse = true }, -- current match in 'wildmenu' completion
		WinBar = { link = "StatusLine" }, -- window bar
		WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.
		Constant = { fg = c.coder_preproc, bold = true }, -- (preferred) any constant
		String = { fg = c.coder_str_constant }, --   a string constant: "this is a string"
		Character = { fg = c.coder_str_constant }, --  a character constant: 'c', '\n'
		Number = { fg = c.coder_int_constant }, --   a number constant: 234, 0xff
		Boolean = { fg = c.coder_bool_constant }, --  a boolean constant: TRUE, false
		Float = { fg = c.coder_float_constant }, --    a floating point constant: 2.3e10
		Identifier = { fg = c.coder_text_default, style = options.styles.variables }, -- (preferred) any variable name
		Function = { fg = c.coder_function, style = options.styles.functions }, -- function name (also: methods for classes)
		Statement = { fg = c.coder_keyword }, -- (preferred) any statement
		Operator = { fg = c.coder_preproc }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = c.coder_keyword, style = options.styles.keywords }, --  any other keyword
		PreProc = { fg = c.coder_preproc }, -- (preferred) generic Preprocessor
		Include = { fg = c.coder_preproc },
		Type = { fg = c.coder_highlight }, -- (preferred) int, long, char, etc.
		Special = { fg = c.coder_highlight_junk }, -- (preferred) any special symbol
		Debug = { fg = c.orange500 }, --    debugging statements
		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Italic = { italic = true },

		Error = { fg = c.red500 }, -- (preferred) any erroneous construct
		Todo = { fg = c.magenta500, bold = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = { fg = c.base0 },
		qfFileName = { fg = c.violet500 },

		htmlH1 = { fg = c.magenta500, bold = true },
		htmlH2 = { fg = c.blue500, bold = true },

		-- mkdHeading = { fg = c.orange, bold = true },
		mkdCode = { bg = c.green900 },
		mkdCodeDelimiter = { fg = c.base0, bg = c.green700 },
		mkdCodeStart = { fg = c.orange500, bold = true },
		mkdCodeEnd = { fg = c.orange500, bold = true },
		-- mkdLink = { fg = c.blue, underline = true },

		markdownHeadingDelimiter = { fg = c.orange500, bold = true },
		markdownCode = { fg = c.yellow500, bg = c.green900 },
		markdownCodeBlock = { fg = c.yellow500, bg = c.green900 },
		markdownH1 = { fg = c.magenta500, bold = true },
		markdownH2 = { fg = c.violet500, bold = true },
		markdownLinkText = { fg = c.blue500, underline = true },

		["helpCommand"] = { fg = c.blue500, bg = c.blue900 },

		debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { fg = c.blue300, bg = c.blue700 }, -- used for breakpoint colors in terminal-debug

		dosIniLabel = { link = "@property" },

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { underline = true }, -- used for highlighting "text" references
		LspReferenceRead = { underline = true }, -- used for highlighting "read" references
		LspReferenceWrite = { underline = true }, -- used for highlighting "write" references

		DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticUnnecessary = { fg = c.base00 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticVirtualTextError = { bg = c.red900, fg = c.red500 }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { bg = c.yellow900, fg = c.yellow500 }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { bg = c.blue900, fg = c.blue500 }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { bg = c.cyan900, fg = c.cyan500 }, -- Used for "Hint" diagnostic virtual text

		DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics

		LspSignatureActiveParameter = { bg = c.base03, bold = true },
		LspCodeLens = { fg = c.base01 },
		LspInlayHint = { bg = c.violet900, fg = c.violet500 },

		LspInfoBorder = { fg = c.base02, bg = c.bg_float },

		DapStoppedLine = { bg = c.yellow700 }, -- Used for "Warning" diagnostic virtual text

		-- These groups are for the Neovim tree-sitter highlights.
		["@annotation"] = { link = "PreProc" },
		["@attribute"] = { link = "PreProc" },
		["@boolean"] = { link = "Boolean" },
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		["@comment"] = { link = "Comment" },
		["@keyword.conditional"] = { link = "Conditional" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Special" },
		["@constant.macro"] = { link = "Define" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.directive.define"] = { link = "Define" },
		["@keyword.exception"] = { link = "Exception" },
		["@number.float"] = { link = "Float" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Special" },
		["@function.call"] = { link = "@function" },
		["@function.macro"] = { link = "Macro" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.coroutine"] = { link = "@keyword" },
		["@keyword.operator"] = { link = "@operator" },
		["@keyword.return"] = { link = "@keyword" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "@function.method" },
		["@namespace.builtin"] = { link = "@variable.builtin" },
		["@none"] = {},
		["@number"] = { link = "Number" },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.storage"] = { link = "StorageClass" },
		["@string"] = { link = "String" },
		["@markup.link.label"] = { link = "SpecialChar" },
		["@markup.link.label.symbol"] = { link = "Identifier" },
		["@tag"] = { link = "Label" },
		["@tag.attribute"] = { link = "@property" },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@markup"] = { link = "@none" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "Type" },
		["@markup.raw"] = { link = "String" },
		["@markup.math"] = { link = "Special" },
		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "Title" },
		["@comment.note"] = { fg = c.hint },
		["@comment.error"] = { fg = c.error },
		["@comment.hint"] = { fg = c.hint },
		["@comment.info"] = { fg = c.info },
		["@comment.warning"] = { fg = c.warning },
		["@comment.todo"] = { link = "Todo" },
		["@markup.link.url"] = { link = "Underlined" },
		["@type"] = { link = "Type" },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "@keyword" },

		--- Misc
		-- ["@comment.documentation"] = { },
		["@operator"] = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in C.

		--- Punctuation
		["@punctuation.delimiter"] = { fg = c.coder_highlight_junk }, -- For delimiters ie: `.`
		["@punctuation.bracket"] = { fg = c.orange500 }, -- For brackets and parens.
		["@punctuation.special"] = { fg = c.orange500 }, -- For special punctutation that does not fall in the catagories before.
		["@punctuation.special.markdown"] = { fg = c.orange500, bold = true },
		["@markup.list"] = { fg = c.blue500 }, -- For special punctutation that does not fall in the catagories before.
		["@markup.list.markdown"] = { fg = c.orange500, bold = true },

		--- Literals
		["@string.documentation"] = { fg = c.cyan500 },
		["@string.regexp"] = { fg = c.coder_str_special }, -- For regexes.
		["@string.escape"] = { fg = c.coder_str_special }, -- For escape characters within a string.

		--- Keywords
		["@keyword"] = { fg = c.coder_keyword, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
		["@keyword.function"] = { fg = c.coder_keyword, style = options.styles.functions }, -- For keywords used to define a fuction.

		["@label"] = { fg = c.coder_preproc }, -- For labels: `label:` in C and `:label:` in Lua.

		--- Types
		["@type.builtin"] = { link = "Type" },
		["@variable.member"] = { fg = c.cyan500 }, -- For fields.
		["@property"] = { link = "Identifier" },

		--- Identifiers
		["@variable"] = { fg = c.coder_text_default, style = options.styles.variables }, -- Any variable name that does not have another highlight.
		["@variable.builtin"] = { fg = c.coder_at_highlight }, -- Variable names that are defined by the languages, like `this` or `self`.
		["@module.builtin"] = { fg = c.coder_at_highlight }, -- Variable names that are defined by the languages, like `this` or `self`.

		--- Text
		-- ["@markup.raw.markdown"] = { fg = c.blue },
		["@markup.raw.markdown_inline"] = { fg = c.yellow500, bg = c.green900 },
		["@markup.link"] = { fg = c.blue500, underline = true },

		["@markup.list.unchecked"] = { fg = c.yellow500 }, -- For brackets and parens.
		["@markup.list.checked"] = { fg = c.green500 }, -- For brackets and parens.

		["@diff.plus"] = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },

		["@module"] = { link = "Include" },

		-- tsx
		["@tag.tsx"] = { fg = c.green500 },
		["@constructor.tsx"] = { fg = c.blue500 },
		["@tag.delimiter.tsx"] = { fg = c.orange500 },

		-- LSP Semantic Token Groups
		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.decorator"] = { link = "@attribute" },
		["@lsp.type.deriveHelper"] = { link = "@attribute" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
		["@lsp.type.generic"] = { link = "@variable" },
		["@lsp.type.interface"] = { fg = c.blue500 },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.lifetime"] = { link = "@keyword.storage" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error },
		["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.defaultLibrary"] = { fg = c.blue500 },
		["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = c.blue500 },
		["@lsp.typemod.variable.callable"] = { link = "@function" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
		["@lsp.typemod.variable.static"] = { link = "@constant" },
		-- NOTE:  maybe add these with distinct highlights?
		-- ["@lsp.typemod.variable.globalScope"] (global variables)

		-- ts-rainbow
		rainbowcol1 = { fg = c.red500 },
		rainbowcol2 = { fg = c.orange500 },
		rainbowcol3 = { fg = c.yellow500 },
		rainbowcol4 = { fg = c.green500 },
		rainbowcol5 = { fg = c.cyan500 },
		rainbowcol6 = { fg = c.blue500 },
		rainbowcol7 = { fg = c.magenta500 },

		-- ts-rainbow2 (maintained fork)
		TSRainbowRed = { fg = c.red },
		TSRainbowOrange = { fg = c.orange },
		TSRainbowYellow = { fg = c.yellow },
		TSRainbowGreen = { fg = c.green },
		TSRainbowBlue = { fg = c.blue },
		TSRainbowViolet = { fg = c.violet500 },
		TSRainbowCyan = { fg = c.cyan },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = c.red },
		RainbowDelimiterOrange = { fg = c.orange },
		RainbowDelimiterYellow = { fg = c.yellow },
		RainbowDelimiterGreen = { fg = c.green },
		RainbowDelimiterBlue = { fg = c.blue },
		RainbowDelimiterViolet = { fg = c.violet },
		RainbowDelimiterCyan = { fg = c.cyan },

		-- LspTrouble
		TroubleText = { fg = c.coder_text_default },
		TroubleCount = { fg = c.magenta500 },
		TroubleNormal = { fg = c.coder_text_default },

		-- Illuminate
		illuminatedWord = { bg = c.violet900 },
		illuminatedCurWord = { bg = c.violet900 },
		IlluminatedWordText = { bg = c.violet900 },
		IlluminatedWordRead = { bg = c.magenta900 },
		IlluminatedWordWrite = { bg = c.magenta900 },

		-- diff
		diffAdded = { fg = c.green500 },
		diffRemoved = { fg = c.red500 },
		diffChanged = { fg = c.yellow500 },
		diffOldFile = { fg = c.violet500 },
		diffNewFile = { fg = c.orange500 },
		diffFile = { fg = c.blue500 },
		diffLine = { fg = c.base01 },
		diffIndexLine = { fg = c.magenta500 },

		-- Neogit
		NeogitBranch = { fg = c.magenta500 },
		NeogitRemote = { fg = c.violet500 },
		NeogitHunkHeader = { fg = c.base0, bg = c.base02 },
		NeogitHunkHeaderHighlight = { fg = c.blue500, bg = c.base02 },
		NeogitDiffContextHighlight = { fg = c.base00, bg = c.base02 },
		NeogitDiffDeleteHighlight = { fg = c.red500, bg = c.red900 },
		NeogitDiffAddHighlight = { fg = c.green500, bg = c.green900 },

		-- Neotest
		NeotestPassed = { fg = c.green500 },
		NeotestRunning = { fg = c.yellow500 },
		NeotestFailed = { fg = c.red500 },
		NeotestSkipped = { fg = c.blue500 },
		NeotestTest = { fg = c.base00 },
		NeotestNamespace = { fg = c.cyan500 },
		NeotestFocused = { fg = c.yellow500 },
		NeotestFile = { fg = c.cyan500 },
		NeotestDir = { fg = c.blue500 },
		NeotestBorder = { fg = c.blue500 },
		NeotestIndent = { fg = c.base00 },
		NeotestExpandMarker = { fg = c.base0 },
		NeotestAdapterName = { fg = c.violet500, bold = true },
		NeotestWinSelect = { fg = c.blue500 },
		NeotestMarked = { fg = c.blue500 },
		NeotestTarget = { fg = c.blue500 },
		--[[ NeotestUnknown = {}, ]]
		-- GitGutter
		GitGutterAdd = { fg = c.coder_comment_pop[0] }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = c.yellow500 }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = c.coder_comment_pop[1] }, -- diff mode: Deleted line |diff.txt|
		GitGutterAddLineNr = { fg = c.coder_comment_pop[0] },
		GitGutterChangeLineNr = { fg = c.yellow500 },
		GitGutterDeleteLineNr = { fg = c.coder_comment_pop[1] },

		-- GitSigns
		GitSignsAdd = { fg = c.coder_comment_pop[0] }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = c.yellow500 }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = c.coder_comment_pop[1] }, -- diff mode: Deleted line |diff.txt|

		-- Telescope
		TelescopeBorder = { fg = c.coder_margin_active, bg = c.coder_background },
		TelescopeNormal = { fg = c.coder_text_default, bg = c.coder_background },

		-- NvimTree
		NvimTreeNormal = { fg = c.coder_text_default, bg = c.coder_background },
		NvimTreeWinSeparator = {
			fg = options.styles.sidebars == "transparent" and c.border or c.margin,
			bg = c.coder_background,
		},
		NvimTreeNormalNC = { fg = c.coder_text_default, bg = c.coder_background },
		NvimTreeRootFolder = { fg = c.blue, bold = true },
		NvimTreeGitDirty = { fg = c.coder_comment_pop[2] },
		NvimTreeGitNew = { fg = c.coder_comment_pop[0] },
		NvimTreeGitDeleted = { fg = c.coder_comment_pop[1] },
		NvimTreeOpenedFile = { bg = c.coder_highlight },
		NvimTreeSpecialFile = { fg = c.violet500, underline = true },
		NvimTreeIndentMarker = { fg = c.base02 },
		NvimTreeImageFile = { fg = c.coder_text_default },
		NvimTreeSymlink = { fg = c.blue },
		NvimTreeFolderIcon = { bg = c.none, fg = c.blue },

		NeoTreeNormal = { fg = c.coder_text_default, bg = c.coder_background },
		NeoTreeNormalNC = { fg = c.coder_text_default, bg = c.coder_background },
		NeoTreeDimText = { fg = c.coder_text_default },

		-- Fern
		FernBranchText = { fg = c.blue },

		-- glyph palette
		GlyphPalette1 = { fg = c.red500 },
		GlyphPalette2 = { fg = c.green },
		GlyphPalette3 = { fg = c.yellow },
		GlyphPalette4 = { fg = c.blue },
		GlyphPalette6 = { fg = c.cyan },
		GlyphPalette7 = { fg = c.fg },
		GlyphPalette9 = { fg = c.red },

		-- Dashboard
		DashboardShortCut = { fg = c.cyan },
		DashboardHeader = { fg = c.blue },
		DashboardCenter = { fg = c.magenta },
		DashboardFooter = { fg = c.yellow, italic = true },
		DashboardKey = { fg = c.orange500 },
		DashboardDesc = { fg = c.cyan500 },
		DashboardIcon = { fg = c.cyan500, bold = true },

		-- Alpha
		AlphaShortcut = { fg = c.orange },
		AlphaHeader = { fg = c.blue },
		AlphaHeaderLabel = { fg = c.orange },
		AlphaFooter = { fg = c.cyan },
		AlphaButtons = { fg = c.cyan },

		-- WhichKey
		WhichKey = { fg = c.cyan },
		WhichKeyGroup = { fg = c.blue },
		WhichKeyDesc = { fg = c.magenta },
		WhichKeySeperator = { fg = c.base01 },
		WhichKeySeparator = { fg = c.base01 },
		WhichKeyFloat = { bg = c.coder_background },
		WhichKeyValue = { fg = c.violet500 },

		-- NeoVim
		healthError = { fg = c.error },
		healthSuccess = { fg = c.cyan },
		healthWarning = { fg = c.warning },
		-- Lazy
		LazyProgressDone = { bold = true, fg = c.magenta500 },
		LazyProgressTodo = { bold = true, fg = c.base01 },

		-- Notify
		NotifyBackground = { fg = c.coder_text_default, bg = c.coder_background },

		--- Border
		NotifyERRORBorder = {
			fg = util.darken(c.error, 0.3),
			bg = options.transparent and c.none or c.coder_background,
		},
		NotifyWARNBorder = {
			fg = util.darken(c.warning, 0.3),
			bg = options.transparent and c.none or c.coder_background,
		},
		NotifyINFOBorder = { fg = util.darken(c.info, 0.3), bg = options.transparent and c.none or c.coder_background },
		NotifyDEBUGBorder = {
			fg = util.darken(c.base01, 0.3),
			bg = options.transparent and c.none or c.coder_background,
		},
		NotifyTRACEBorder = {
			fg = util.darken(c.violet500, 0.3),
			bg = options.transparent and c.none or c.coder_background,
		},
		--- Icons
		NotifyERRORIcon = { fg = c.error },
		NotifyWARNIcon = { fg = c.warning },
		NotifyINFOIcon = { fg = c.info },
		NotifyDEBUGIcon = { fg = c.base01 },
		NotifyTRACEIcon = { fg = c.violet500 },
		--- Title
		NotifyERRORTitle = { fg = c.error },
		NotifyWARNTitle = { fg = c.warning },
		NotifyINFOTitle = { fg = c.info },
		NotifyDEBUGTitle = { fg = c.base01 },
		NotifyTRACETitle = { fg = c.violet500 },
		--- Body
		NotifyERRORBody = { fg = c.coder_text_default, bg = options.transparent and c.none or c.coder_background },
		NotifyWARNBody = { fg = c.coder_text_default, bg = options.transparent and c.none or c.coder_background },
		NotifyINFOBody = { fg = c.coder_text_default, bg = options.transparent and c.none or c.coder_background },
		NotifyDEBUGBody = { fg = c.coder_text_default, bg = options.transparent and c.none or c.coder_background },
		NotifyTRACEBody = { fg = c.coder_text_default, bg = options.transparent and c.none or c.coder_background },

		-- Noice

		NoiceCompletionItemKindDefault = { fg = c.coder_text_default, bg = c.none },

		TreesitterContext = { bg = c.coder_margin_hover },
		Hlargs = { fg = c.yellow },
	}

	-- something

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
				theme.highlights["LspDiagnostics" .. type .. iold] = {
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
