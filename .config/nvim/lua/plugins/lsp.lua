return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                typeCheckingMode = "basic",
                ignore = { "*" },
                disableOrganizeImports = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        djlsp = {
          cmd = { "/Users/rubenhesselink/.local/share/nvim/mason/bin/djlsp", "--enable-log" },
          -- cmd = { "/Users/rubenhesselink/projects/django-template-lsp/env/bin/djlsp", "--enable-log" },
        },
      },
    },
  },
}
