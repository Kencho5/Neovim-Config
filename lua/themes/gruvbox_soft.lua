local M = {}

M.base_30 = {
  white = "#dfbf8e",
  darker_black = "#2b2827",
  black = "#282828", --  nvim bg
  black2 = "#2e2e2e",
  one_bg = "#353535",
  one_bg2 = "#3f3f3f",
  one_bg3 = "#444444",
  grey = "#4b4b4b",
  grey_fg = "#4e4e4e",
  grey_fg2 = "#505050",
  light_grey = "#656565",
  red = "#fb4934",
  baby_pink = "#cc241d",
  pink = "#ff75a0",
  line = "#36393a",
  green = "#b8bb26",
  vibrant_green = "#a9b665",
  nord_blue = "#8dc07c",
  blue = "#458588",
  yellow = "#d79921",
  sun = "#fabd2f",
  purple = "#b4bbc8",
  dark_purple = "#d3869b",
  teal = "#749689",
  orange = "#e78a4e",
  cyan = "#83a598",
  statusline_bg = "#2c2c2c",
  lightbg = "#3d3d3d",
  pmenu_bg = "#83a598",
  folder_bg = "#8b9553",
}

M.base_16 = {
  base00 = "#32302f",
  base01 = "#3c3836",
  base02 = "#423e3c",
  base03 = "#484442",
  base04 = "#bdae93",
  base05 = "#dfbf8e",
  base06 = "#ebdbb2",
  base07 = "#fbf1c7",
  base08 = "#fb4934",
  base09 = "#fe8019",
  base0A = "#fabd2e",
  base0B = "#b9bb25",
  base0C = "#8ec07c",
  base0D = "#f74732",
  base0E = "#d3869b",
  base0F = "#d65d0e",
}

M.type = "dark"

M = require("base46").override_theme(M, "gruvbox")

M.polish_hl = {
  Operator = {
    fg = M.base_30.nord_blue,
  },
  ["@operator"] = {
    fg = M.base_30.nord_blue,
  },
  ["@function"] = { fg = M.base_30.sun },
  ["@function.builtin"] = { fg = M.base_30.cyan },
  ["@function.call"] = {
    fg = M.base_30.green,
  },
  ["@variable"] = { fg = M.base_30.cyan },
  Identifier = {
    fg = M.base_30.green,
  },
}

return M


