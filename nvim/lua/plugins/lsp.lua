return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        chesslsp = {},
      },
      setup = {
        chesslsp = function(_, opts)
          local lspconfig = require("lspconfig")
          local configs = require("lspconfig.configs")

          if not configs.chesslsp then
            configs.chesslsp = {
              default_config = {
                cmd = {
                  "/home/sammyshear/Coding/chesslsp/chesslsp",
                },
                filetypes = {
                  "pgn",
                },
                single_file_support = true,
              },
            }
          end
          lspconfig.chesslsp.setup(opts)
        end,
      },
    },
  },
}
