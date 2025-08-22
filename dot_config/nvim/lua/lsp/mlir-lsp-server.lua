---@type vim.lsp.Config
return {
  cmd = { 'mlir-lsp-server' },
  filetypes = { 'mlir' },
  root_markers = { '.git' },
}
