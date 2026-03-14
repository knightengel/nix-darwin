local set_hl = vim.api.nvim_set_hl

set_hl(0, "Normal", { bg = "NONE" })
set_hl(0, "NormalNC", { bg = "NONE" })
set_hl(0, "SignColumn", { bg = "NONE" })
set_hl(0, "EndOfBuffer", { fg = "#f6e9e9", bg = "NONE" })

set_hl(0, "NormalFloat", { bg = "#fcf7f7" })
set_hl(0, "FloatBorder", { fg = "#8b0000", bg = "#fcf7f7" })

set_hl(0, "CursorLine", { bg = "#f8eded" })
set_hl(0, "Visual", { bg = "#f0d6d6", fg = "#8b0000" })

set_hl(0, "Search", { bg = "#8b0000", fg = "#ffffff" })
set_hl(0, "IncSearch", { bg = "#b22222", fg = "#ffffff" })

set_hl(0, "LineNr", { fg = "#b96a6a" })
set_hl(0, "CursorLineNr", { fg = "#8b0000", bold = true })
