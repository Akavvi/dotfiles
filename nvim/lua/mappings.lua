function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

-- fzf keybindings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fl", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>e", "<cmd>Telescope file_browser<CR>")

-- Magic resize with arrows
map("n", "<Left>", ":vertical resize +1<CR>")
map("n", "<Right>", ":vertical resize -1<CR>")
map("n", "<Up>", ":resize -1<CR>")
map("n", "<Down>", ":resize +1<CR>")

-- Move to windows with W 
map("n", "<C-l>", "<C-W>l")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
-- fuck Ctrl-A
map("n", "<C-a>", "gg0vG$")
map("n", "<C-s>", "<cmd>w<CR>")
map("n", "<Esc>", "<cmd>noh<CR>")
