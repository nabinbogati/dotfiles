return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "off", -- Keeps diagnostics quiet
                inlayHints = {
                  variableTypes = false,
                  functionReturnTypes = false,
                  callArgumentNames = false,
                  genericTypeArguments = false, -- or genericTypes if that's the key
                },
              },
            },
          },
        },
      },
    },
  },
}
