-- ========================================================================== --
--                               BASIC SETTINGS                               --
-- ========================================================================== --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4         
vim.opt.shiftwidth = 4      
vim.opt.expandtab = true    
vim.opt.autoindent = true   

vim.opt.ignorecase = true   
vim.opt.smartcase = true    
vim.opt.incsearch = true    
vim.opt.hlsearch = false    

vim.opt.termguicolors = true 
vim.opt.cursorline = true    
vim.opt.scrolloff = 8        
vim.opt.signcolumn = "yes"   
vim.opt.mouse = "a"          

vim.opt.clipboard = "unnamedplus" 
vim.opt.swapfile = false           
vim.opt.backup = false             
vim.opt.updatetime = 250           

-- ========================================================================== --
--                    NATIVE PLUGINFREE CATPPUCCIN MOCHA                      --
-- ========================================================================== --

-- Define the official Catppuccin Mocha hex palette
local cp = {
    rosewater = "#f5e0dc", flamingo  = "#f2cdcd", pink      = "#f5c2e7",
    mauve     = "#cba6f7", red       = "#f38ba8", maroon    = "#eba0ac",
    peach     = "#fab387", yellow    = "#f9e2af", green     = "#a6e3a1",
    teal      = "#94e2d5", sky       = "#89dceb", sapphire  = "#74c7ec",
    blue      = "#89b4fa", lavender  = "#b4befe", text      = "#cdd6f4",
    subtext1  = "#bac2de", subtext0  = "#a6adc8", overlay2  = "#9399b2",
    overlay1  = "#7f849c", overlay0  = "#6c7086", surface2  = "#585b70",
    surface1  = "#45475a", surface0  = "#313244", base      = "#1e1e2e",
    mantle    = "#181825", crust     = "#11111b",
}

-- Apply background reset
vim.opt.background = "dark"

-- Helper function to quickly map highlights
local function hl(group, styles)
    vim.api.nvim_set_hl(0, group, styles)
end

-- Core Editor Colors
hl("Normal",       { fg = cp.text, bg = cp.base })
hl("NormalFloat",  { fg = cp.text, bg = cp.mantle })
hl("CursorLine",   { bg = cp.surface0 })
hl("CursorLineNr", { fg = cp.lavender, bold = true })
hl("LineNr",       { fg = cp.surface2 })
hl("Visual",       { bg = cp.surface1 })
hl("Search",       { fg = cp.mantle, bg = cp.yellow })
hl("IncSearch",    { fg = cp.mantle, bg = cp.pink })
hl("SignColumn",   { bg = cp.base })
hl("ColorColumn",  { bg = cp.surface0 })
hl("StatusLine",   { fg = cp.text, bg = cp.mantle })
hl("StatusLineNC", { fg = cp.surface1, bg = cp.mantle })
hl("VertSplit",    { fg = cp.crust, bg = cp.crust })
hl("Pmenu",        { fg = cp.text, bg = cp.surface0 })
hl("PmenuSel",     { fg = cp.base, bg = cp.blue, bold = true })

-- Syntax Highlighting
hl("Comment",      { fg = cp.overlay0, italic = true })
hl("Constant",     { fg = cp.peach })
hl("String",       { fg = cp.green })
hl("Character",    { fg = cp.green })
hl("Number",       { fg = cp.peach })
hl("Boolean",      { fg = cp.peach, bold = true })
hl("Float",        { fg = cp.peach })
hl("Identifier",   { fg = cp.flamingo })
hl("Function",     { fg = cp.blue })
hl("Statement",    { fg = cp.mauve })
hl("Conditional",  { fg = cp.mauve })
hl("Repeat",       { fg = cp.mauve })
hl("Label",        { fg = cp.blue })
hl("Operator",     { fg = cp.sky })
hl("Keyword",      { fg = cp.mauve })
hl("Exception",    { fg = cp.mauve })
hl("PreProc",      { fg = cp.pink })
hl("Include",      { fg = cp.pink })
hl("Define",       { fg = cp.pink })
hl("Macro",        { fg = cp.pink })
hl("Type",         { fg = cp.yellow })
hl("StorageClass", { fg = cp.yellow })
hl("Structure",    { fg = cp.yellow })
hl("Typedef",      { fg = cp.yellow })
hl("Special",      { fg = cp.pink })
hl("Underlined",   { underline = true })
hl("Error",        { fg = cp.red, bold = true })
hl("Todo",         { fg = cp.base, bg = cp.yellow, bold = true })

-- Netrw (Built-in File Explorer) overrides
hl("NetrwDir",     { fg = cp.blue, bold = true })
hl("NetrwClass",   { fg = cp.text })
hl("NetrwLink",    { fg = cp.teal })

-- ========================================================================== --
--                                KEYMAPS                                     --
-- ========================================================================== --

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>e", "<cmd>Lex 30<CR>", { desc = "Toggle Netrw File Explorer" })

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- ========================================================================== --
--                        BUILT-IN FEATURES CONFIG                          --
-- ========================================================================== --

vim.g.netrw_banner = 0       
vim.g.netrw_liststyle = 3    
vim.g.netrw_winsize = 25     
