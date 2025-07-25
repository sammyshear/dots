return {
  { "wakatime/vim-wakatime", lazy = false },
  {
    "sammyshear/sefaria.nvim",
    name = "sefaria.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    opts = {},
    version = "*",
  },
  { "dopefishh/vim-praat" },
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "nvim-orgmode/org-bullets.nvim",
      "saghen/blink.cmp",
    },
    event = "VeryLazy",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/orgmode/**/*",
        org_default_notes_file = "~/orgmode/refile.org",
      })
      require("org-bullets").setup()
      require("blink.cmp").setup({
        sources = {
          per_filetype = {
            org = { "orgmode" },
          },
          providers = {
            orgmode = {
              name = "Orgmode",
              module = "orgmode.org.autocompletion.blink",
              fallbacks = { "buffer" },
            },
          },
        },
      })
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
  {
    {
      "mfussenegger/nvim-lint",
      opts = {
        linters = {
          ["markdownlint-cli2"] = {
            args = { "--config", vim.fn.expand("~") .. "/markdownlint.yaml", "--" },
          },
        },
      },
    },
  },
  {
    "mpas/marp-nvim",
    cmd = "MarpStart",
    config = function()
      require("marp").setup()
    end,
  },
  {
    "lambdalisue/vim-suda",
  },
  {
    "3rd/image.nvim",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        opts = {
          rocks = { "magick" },
        },
      },
    },
    config = function()
      return (
        require("image").setup({
          kitty_method = "normal",
          backend = "kitty",
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = true,
              filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
            },
            neorg = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              filetypes = { "norg" },
            },
            html = {
              enabled = false,
            },
            css = {
              enabled = false,
            },
          },
          max_width = nil,
          max_height = nil,
          max_width_window_percentage = nil,
          max_height_window_percentage = 50,
          window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
          window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
          editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
          tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
          hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
        })
      )
    end,
  },
  {
    "klen/nvim-config-local",
    config = function()
      require("config-local").setup()
    end,
  },
  {
    "arminveres/md-pdf.nvim",
    branch = "main", -- you can assume that main is somewhat stable until releases will be made
    lazy = true,
    keys = {
      {
        "<leader>o,",
        function()
          require("md-pdf").convert_md_to_pdf()
        end,
        desc = "Markdown preview",
      },
    },
    opts = {
      toc = false,
      pandoc_user_args = {
        "--pdf-engine=lualatex",
      },
    },
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      -- refer to `:h file-pattern` for more examples
      "BufReadPre "
        .. vim.fn.expand("~")
        .. "/Documents/notes/*.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/Documents/notes/*.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/Documents/notes/",
        },
      },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>och"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
        ["<leader>on"] = {
          action = function()
            return vim.cmd("ObsidianNew")
          end,
        },
        ["<leader>of"] = {
          action = function()
            return vim.cmd("ObsidianQuickSwitch")
          end,
        },
        ["<leader>o/"] = {
          action = function()
            return vim.cmd("ObsidianSearch")
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        templ = { "templ" },
      },
    },
  },
}
