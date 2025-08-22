---@brief
---
--- https://mlir.llvm.org/docs/Tools/MLIRLSP/#mlir-lsp-language-server--mlir-lsp-server=
---
--- The Language Server for the LLVM MLIR language
---
--- `mlir-lsp-server` can be installed at the llvm-project repository (https://github.com/llvm/llvm-project)

---@type vim.lsp.Config
return {
  -- cmd = { '/Users/jjasmine/Developer/igalia/llvm-project/build/bin/mlir-lsp-server' },
  cmd = { '/home/usainzg/Projects/topoly-distmem/externals/llvm-project/build/bin/mlir-lsp-server' },
  filetypes = { 'mlir' },
  root_markers = { '.git' },
}
