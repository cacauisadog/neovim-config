local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("caue.lsp.lsp-installer")
require("caue.lsp.handlers").setup()
require("caue.lsp.null-ls")
