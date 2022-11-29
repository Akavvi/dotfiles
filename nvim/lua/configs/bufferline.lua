local status,bufferline = pcall(require,'bufferline')
if not status then return end

local opts = {
  options = {
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'buffer_close' }
    },
    buffer_close_icon = '',
    modified_icon = '',
    indicator = {
      style = 'underline'
    },
    diagnostics = 'nvim_lsp'
  }
}
bufferline.setup(opts)
