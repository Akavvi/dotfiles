local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require "nvim-lsp-installer"
  local lspconfig = require "lspconfig"

  local servers = lsp_installer.get_installed_servers()

  for _,server in ipairs(servers) do
    lspconfig[server.name].setup {
      on_attach = attach,
      capabilities = capabilities
    }
  end
end

return M
