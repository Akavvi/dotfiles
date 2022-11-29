local status_mason, mason = pcall(require, 'mason')
local status_configurer, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not status_mason or not status_configurer then return end

mason.setup()
mason_lspconfig.setup()
