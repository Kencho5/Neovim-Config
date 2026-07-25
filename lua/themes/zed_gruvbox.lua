-- Gruvbox Soft, matched to the Zed editor theme of the same name.
-- Editor and file-tree share one flat #282828 background; accents are softer
-- than stock gruvbox (#e85740 red, #f1bf4f yellow, #b9bb46 green) and
-- operators/brackets get their own muted colors rather than plain fg.
--
-- base46 theme (NvChad's theming engine) -- not ellisonleao/gruvbox.nvim.

local M = {}

M.base_30 = {
  white = "#e8dcb7", -- body text / variables
  darker_black = "#242424",
  black = "#282828", -- nvim bg (file tree shares this)
  black2 = "#2f2e2d",
  one_bg = "#343130",
  one_bg2 = "#3f3b39",
  one_bg3 = "#4b4541",
  grey = "#6e6b5f", -- line numbers
  grey_fg = "#6d6459",
  grey_fg2 = "#7d7263",
  light_grey = "#978b7a", -- comments / faded + ignored tree entries
  red = "#e85740",
  baby_pink = "#c8899b",
  pink = "#c8899b",
  line = "#343130",
  green = "#b9bb46",
  vibrant_green = "#98bf83",
  nord_blue = "#8aa499",
  blue = "#8aa499",
  yellow = "#f1bf4f",
  sun = "#f1bf4f",
  purple = "#c8899b",
  dark_purple = "#b16286",
  teal = "#8aa499",
  cyan = "#8aa499",
  orange = "#e8a05a",
  statusline_bg = "#2f2e2d",
  lightbg = "#343130",
  pmenu_bg = "#b9bb46",
  folder_bg = "#c2b69a",
}

M.base_16 = {
  base00 = "#282828", -- bg
  base01 = "#343130",
  base02 = "#4b4541", -- selection
  base03 = "#978b7a", -- comments
  base04 = "#c2b69a",
  base05 = "#e8dcb7", -- default fg
  base06 = "#e8dcb7",
  base07 = "#f9f1cb",
  base08 = "#e8dcb7", -- variables
  base09 = "#c8899b", -- numbers
  base0A = "#f1bf4f", -- types, classes
  base0B = "#b9bb46", -- strings
  base0C = "#8aa499", -- escapes, regex
  base0D = "#b9bb46", -- functions
  base0E = "#e85740", -- keywords
  base0F = "#e8a05a",
}

M.type = "dark"

M = require("base46").override_theme(M, "zed_gruvbox")

M.polish_hl = {
  treesitter = {
    -- keywords are the hot red, including type/decl keywords like
    -- `interface`, `private`, `readonly` and the `void` return type
    ["@keyword"] = { fg = M.base_30.red },
    ["@keyword.function"] = { fg = M.base_30.red },
    ["@keyword.return"] = { fg = M.base_30.red },
    ["@keyword.operator"] = { fg = M.base_30.red },
    ["@keyword.modifier"] = { fg = M.base_30.red },
    ["@keyword.type"] = { fg = M.base_30.red },
    ["@keyword.conditional"] = { fg = M.base_30.red },
    ["@keyword.repeat"] = { fg = M.base_30.red },
    ["@keyword.exception"] = { fg = M.base_30.red },
    ["@conditional"] = { fg = M.base_30.red },
    ["@repeat"] = { fg = M.base_30.red },
    ["@type.qualifier"] = { fg = M.base_30.red },
    ["@storageclass"] = { fg = M.base_30.red },
    -- ts `import`/`from`, rust `use`/`mod`/`as`. base46 ships this capture as
    -- { link = "Include" } and merges our table into it, so the link survives
    -- and would beat any fg -- clear it explicitly.
    ["@keyword.import"] = { fg = M.base_30.red, link = "" },
    ["@include"] = { fg = M.base_30.red },
    ["@lsp.type.keyword"] = { fg = M.base_30.red },

    -- functions and strings share the same green
    ["@function"] = { fg = M.base_30.green },
    ["@function.call"] = { fg = M.base_30.green },
    ["@function.builtin"] = { fg = M.base_30.green },
    ["@function.method"] = { fg = M.base_30.green },
    ["@function.method.call"] = { fg = M.base_30.green },
    ["@function.macro"] = { fg = M.base_30.green },
    ["@attribute"] = { fg = M.base_30.green }, -- @Injectable decorator
    ["@string"] = { fg = M.base_30.green },
    ["@string.escape"] = { fg = M.base_30.teal },

    -- types, classes and screaming-case constants are yellow
    ["@type"] = { fg = M.base_30.yellow },
    ["@type.builtin"] = { fg = M.base_30.yellow },
    ["@type.definition"] = { fg = M.base_30.yellow },
    ["@constructor"] = { fg = M.base_30.yellow },
    ["@constant"] = { fg = M.base_30.yellow },
    ["@constant.builtin"] = { fg = M.base_30.yellow },
    ["@lsp.type.class"] = { fg = M.base_30.yellow },
    ["@lsp.type.interface"] = { fg = M.base_30.yellow },
    ["@lsp.type.enum"] = { fg = M.base_30.yellow },
    ["@lsp.type.typeParameter"] = { fg = M.base_30.yellow },

    -- plain identifiers, properties and params are body text
    ["@variable"] = { fg = M.base_30.white },
    ["@variable.member"] = { fg = M.base_30.white },
    ["@variable.parameter"] = { fg = M.base_30.white },
    ["@property"] = { fg = M.base_30.white },
    ["@parameter"] = { fg = M.base_30.white },
    ["@field"] = { fg = M.base_30.white },
    ["@variable.builtin"] = { fg = M.base_30.teal }, -- `this`

    ["@number"] = { fg = M.base_30.purple },
    ["@number.float"] = { fg = M.base_30.purple },
    ["@boolean"] = { fg = M.base_30.purple },

    -- operators are a muted green; braces/parens a warm grey, but the
    -- statement-ending `;` and `,` stay near body text
    ["@operator"] = { fg = "#98bf83" },
    ["@punctuation.bracket"] = { fg = "#a59a86" },
    ["@punctuation.delimiter"] = { fg = "#e2d6b1" },
    ["@punctuation.special"] = { fg = "#a59a86" },

    -- markup tags: element names green, attributes aqua, angle brackets grey.
    -- these captures are markup-only, so they don't touch TS/JS highlighting.
    ["@tag"] = { fg = "#98bf83" },
    ["@tag.builtin"] = { fg = "#98bf83" },
    ["@tag.attribute"] = { fg = M.base_30.teal },
    ["@tag.delimiter"] = { fg = "#a59a86" },
    ["@comment"] = { fg = M.base_30.light_grey, italic = true },

    -- markdown
    ["@markup.heading"] = { fg = M.base_30.green, bold = true },
    ["@markup.strong"] = { fg = M.base_30.red, bold = true },
    ["@markup.italic"] = { fg = M.base_30.red, italic = true },
    ["@markup.quote"] = { fg = M.base_30.teal },
    ["@markup.link.url"] = { fg = M.base_30.sun },
  },

  cmp = {
    -- completion menu, matched to Zed: #393735 popup, #5a524d selected row,
    -- item text colored by kind, muted #aba289 for the kind/detail column
    CmpPmenu = { bg = "#393735" },
    CmpDoc = { bg = "#393735" },
    CmpDocBorder = { fg = "#4b4541", bg = "#393735" },
    CmpSel = { bg = "#5a524d", bold = true, link = "" },
    CmpItemAbbr = { fg = "#e8dcb7" },
    CmpItemAbbrMatch = { fg = "#b9bb46", bold = true },
    CmpItemAbbrMatchFuzzy = { fg = "#b9bb46", bold = true },
    CmpItemAbbrDeprecated = { fg = "#978b7a", strikethrough = true },
    CmpItemMenu = { fg = "#aba289" },
    CmpItemKind = { fg = "#aba289" },

    -- kind icons/labels follow the same palette as the syntax theme
    CmpItemKindKeyword = { fg = M.base_30.red },
    CmpItemKindSnippet = { fg = M.base_30.red },
    CmpItemKindFunction = { fg = M.base_30.green },
    CmpItemKindMethod = { fg = M.base_30.green },
    CmpItemKindConstructor = { fg = M.base_30.yellow },
    CmpItemKindClass = { fg = M.base_30.yellow },
    CmpItemKindInterface = { fg = M.base_30.yellow },
    CmpItemKindStruct = { fg = M.base_30.yellow },
    CmpItemKindStructure = { fg = M.base_30.yellow },
    CmpItemKindEnum = { fg = M.base_30.yellow },
    CmpItemKindType = { fg = M.base_30.yellow },
    CmpItemKindModule = { fg = M.base_30.yellow },
    CmpItemKindVariable = { fg = M.base_30.white },
    CmpItemKindIdentifier = { fg = M.base_30.white },
    CmpItemKindField = { fg = M.base_30.white },
    CmpItemKindProperty = { fg = M.base_30.white },
    CmpItemKindConstant = { fg = M.base_30.purple },
    CmpItemKindEnumMember = { fg = M.base_30.purple },
    CmpItemKindUnit = { fg = M.base_30.purple },
    CmpItemKindText = { fg = M.base_30.white },
    CmpItemKindReference = { fg = M.base_30.teal },
    CmpItemKindColor = { fg = M.base_30.teal },
    CmpItemKindFile = { fg = M.base_30.teal },
    CmpItemKindFolder = { fg = M.base_30.teal },
  },

  defaults = {
    Operator = { fg = "#98bf83" },
    Delimiter = { fg = "#a59a86" },
    Pmenu = { bg = "#393735" },
    PmenuSel = { bg = "#5a524d", bold = true },
    PmenuSbar = { bg = "#393735" },
    PmenuThumb = { bg = "#5a524d" },
    -- base46 links @keyword.import -> Include (base0D, green), and a link
    -- beats any fg we set on the capture, so recolor Include itself
    Include = { fg = M.base_30.red },
    PreProc = { fg = M.base_30.red },

    -- html/angular templates: match Zed's green tags + aqua attributes.
    -- vim's legacy html groups, for anything treesitter doesn't capture.
    htmlTag = { fg = "#a59a86" },
    htmlEndTag = { fg = "#a59a86" },
    htmlTagName = { fg = "#98bf83" },
    htmlSpecialTagName = { fg = "#98bf83" },
    htmlArg = { fg = "#8aa499" },
    htmlString = { fg = "#b9bb46" },
    -- lsp semantic tokens win over treesitter in angular templates
    ["@lsp.type.component"] = { fg = "#98bf83" },
    ["@lsp.type.property.html"] = { fg = "#8aa499" },
    ["@lsp.type.property.htmlangular"] = { fg = "#8aa499" },

    LineNr = { fg = "#6e6b5f" },
    CursorLineNr = { fg = "#e8dcb7" },
    CursorLine = { bg = "#353332" }, -- line the cursor is on
    CursorColumn = { bg = "#353332" },
    Visual = { bg = "#3f4542" }, -- selection / highlighted text
    VisualNOS = { bg = "#3f4542" },
    ColorColumn = { bg = "#353332" },
    Cursor = { fg = "#282828", bg = "#8aa499" },
    lCursor = { fg = "#282828", bg = "#8aa499" },
    TermCursor = { fg = "#282828", bg = "#8aa499" },

    -- file tree shares the editor background
    NvimTreeNormal = { bg = "#282828", fg = "#c2b69a" },
    NvimTreeNormalNC = { bg = "#282828", fg = "#c2b69a" },
    NvimTreeWinSeparator = { fg = "#282828", bg = "#282828" },
    NvimTreeFolderName = { fg = "#c2b69a" },
    NvimTreeOpenedFolderName = { fg = "#c2b69a" },
    NvimTreeEmptyFolderName = { fg = "#978b7a" },
    NvimTreeGitIgnored = { fg = "#978b7a" },
    NvimTreeSpecialFile = { fg = "#c2b69a" },
    NvimTreeRootFolder = { fg = "#978b7a" },

    -- active tab label
    TbLineBufOn = { fg = "#f9f1cb", bg = "#282828" },
    TbLineBufOff = { fg = "#978b7a", bg = "#2f2e2d" },

    -- unused / unnecessary code, as dimmed by the LSP
    DiagnosticUnnecessary = { fg = "#afa58c" },
    ["@lsp.mod.unused"] = { fg = "#afa58c" },

    NormalFloat = { bg = "#2f2e2d" },
    FloatBorder = { fg = "#4b4541", bg = "#2f2e2d" },
    WinSeparator = { fg = "#343130" },
  },
}

return M
