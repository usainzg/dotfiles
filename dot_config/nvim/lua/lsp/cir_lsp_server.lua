local utils = require 'utils'

---@brief
---
---
--- The Language Server for the LLVM MLIR language, CIR version
---

---@type vim.lsp.Config
return {
  cmd = { utils.clangir_repo .. '/build/bin/cir-lsp-server' },
  -- filetypes = { 'cir' },
  root_markers = { '.git' },
}
