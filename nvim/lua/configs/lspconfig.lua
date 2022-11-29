local status_mason, mason = pcall(require, 'mason')
local status_configurer, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status_navic, navic = pcall(require, 'nvim-navic')
local status_cmp, cmp = pcall(require, 'cmp_nvim_lsp')

if not status_mason or not status_configurer or not status_navic then return end

if not status_cmp then return end
local capabilities = cmp.default_capabilities()

mason.setup()
mason_lspconfig.setup()

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>f', vim.diagnostic.open_float, opts)
map('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', 'd]', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  navic.attach(client,bufnr)
  map('n', '<leader>dc', vim.lsp.buf.declaration,opts)
  map('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', bufopts)
  map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<space>ra', '<cmd>Lspsaga rename<CR>', bufopts)
  map('n', '<space>ca', '<cmd>Lspsaga code_action<CR>', bufopts)
  map('n', '<space>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
end

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
  end
}
