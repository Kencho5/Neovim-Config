-- Gruvbox Soft, matched to the Zed editor theme of the same name.
-- Colors sampled directly from a Zed screenshot: editor bg is #282828 with
-- warm-grey chrome (#3a3735 panels, #4b4541 statusline) and slightly hotter
-- accents than stock gruvbox (#ff4933 red, #fabd2e yellow, #b9bb25 green).
--
-- base46 theme (NvChad's theming engine) -- not ellisonleao/gruvbox.nvim.

local M = {}

M.base_30 = {
  white = "#ebdbb2", -- body text / variables
  darker_black = "#242424",
  black = "#282828", -- nvim bg
  black2 = "#2f2e2d",
  one_bg = "#3a3735", -- sidebar / tabline bg
  one_bg2 = "#4b4541", -- statusline bg
  one_bg3 = "#5c524c", -- selected row
  grey = "#665c54", -- line numbers
  grey_fg = "#736f61",
  grey_fg2 = "#7f7a6b",
  light_grey = "#928374", -- comments
  red = "#ff4933",
  baby_pink = "#d3869b",
  pink = "#d3869b",
  line = "#3a3735",
  green = "#b9bb25",
  vibrant_green = "#b9bb25",
  nord_blue = "#8ec07c",
  blue = "#8ec07c",
  yellow = "#fabd2e",
  sun = "#fabd2e",
  purple = "#d3869b",
  dark_purple = "#b16286",
  teal = "#8ec07c",
  cyan = "#8ec07c",
  orange = "#fe8019",
  statusline_bg = "#3a3735",
  lightbg = "#3a3735",
  pmenu_bg = "#b9bb25",
  folder_bg = "#bbac90",
}

M.base_16 = {
  base00 = "#282828", -- bg
  base01 = "#3a3735",
  base02 = "#5c524c", -- selection
  base03 = "#928374", -- comments
  base04 = "#bbac90",
  base05 = "#ebdbb2", -- default fg
  base06 = "#d5c4a1",
  base07 = "#fbf1c7",
  base08 = "#ebdbb2", -- variables
  base09 = "#d3869b", -- constants, numbers
  base0A = "#fabd2e", -- types, classes
  base0B = "#b9bb25", -- strings
  base0C = "#8ec07c", -- escapes, regex
  base0D = "#b9bb25", -- functions
  base0E = "#ff4933", -- keywords
  base0F = "#fe8019",
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
    ["@keyword.import"] = { fg = M.base_30.red },
    ["@keyword.modifier"] = { fg = M.base_30.red },
    ["@keyword.type"] = { fg = M.base_30.red },
    ["@keyword.conditional"] = { fg = M.base_30.red },
    ["@keyword.repeat"] = { fg = M.base_30.red },
    ["@keyword.exception"] = { fg = M.base_30.red },
    ["@conditional"] = { fg = M.base_30.red },
    ["@repeat"] = { fg = M.base_30.red },
    ["@type.qualifier"] = { fg = M.base_30.red },
    ["@storageclass"] = { fg = M.base_30.red },

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

    ["@operator"] = { fg = M.base_30.white },
    ["@punctuation.bracket"] = { fg = M.base_30.white },
    ["@punctuation.delimiter"] = { fg = M.base_30.white },
    ["@punctuation.special"] = { fg = M.base_30.white },

    ["@tag"] = { fg = M.base_30.red },
    ["@tag.attribute"] = { fg = M.base_30.yellow },
    ["@tag.delimiter"] = { fg = M.base_30.light_grey },
    ["@comment"] = { fg = M.base_30.light_grey, italic = true },

    -- markdown
    ["@markup.heading"] = { fg = M.base_30.green, bold = true },
    ["@markup.strong"] = { fg = M.base_30.red, bold = true },
    ["@markup.italic"] = { fg = M.base_30.red, italic = true },
    ["@markup.quote"] = { fg = M.base_30.teal },
    ["@markup.link.url"] = { fg = M.base_30.sun },
  },

  defaults = {
    LineNr = { fg = "#665c54" },
    CursorLineNr = { fg = "#ebdbb2" },
    CursorLine = { bg = "#32302f" },
    Visual = { bg = "#5c524c" },
    ColorColumn = { bg = "#32302f" },
    NormalFloat = { bg = "#3a3735" },
    FloatBorder = { fg = "#4b4541", bg = "#3a3735" },
    Pmenu = { bg = "#3a3735" },
    PmenuSel = { bg = "#5c524c" },
    WinSeparator = { fg = "#3a3735" },
  },
}

return M
