local M = {}

M.options = {
  user = function ()
    require "custom.options"
  end
}

M.ui = {
   theme = "tokyodark",
   theme_toggle = {
     "tokyonight",
     "tokyodark"
   }
}

M.plugins = {
  user = require "custom.plugins",
  options = {
    lspconfig = {
      setup_lspconf = "custom.configs.lsp-setup"
    }
  }
}

return M
