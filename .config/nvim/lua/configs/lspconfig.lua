local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {
    filetypes = { "html", "templ" },
  },
  cssls = {},
  bashls = {},
  gopls = {},

  basedpyright = {
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "off",
          ignore = { "reportAttributeAccessIssue" },
        },
      },
    },
  },
  djlsp = {
    cmd = {
      "djlsp",
      "--enable-log",
    },
  },
  htmx = {
    filetypes = { "html", "templ" },
  },
  -- templ = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
