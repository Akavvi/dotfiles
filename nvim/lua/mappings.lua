local M = {}

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local map = M.map

map("n", "<Left>", ":vertical resize +1<CR>")
map("n", "<Right>", ":vertical resize -1<CR>")
map("n", "<Up>", ":resize -1<CR>")
map("n", "<Down>", ":resize +1<CR>")

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fl", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")

map("n", "<C-S>", "<cmd>w<CR>")
map("n", "<C-O>", "<cmd>TZAtaraxis<CR>")

map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")
map("n", "<C-E>", "<cmd>NvimTreeToggle<CR>")

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<leader>x", "<cmd>bd<CR>")

map("n", "<leader>/", "<cmd> lua require('Comment.api').toggle.linewise.current()<CR>")

map("n", "<C-l>", "<C-W>l")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-a>", "ggvG$")

return M
