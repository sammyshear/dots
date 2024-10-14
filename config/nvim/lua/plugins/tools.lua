return {
  { "wakatime/vim-wakatime", lazy = false },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "gsuuon/note.nvim",
    opts = {
      spaces = {
        "~/Documents/notes",
      },
    },
    cmd = "Note",
    ft = "note",
  },
  {
    "OscarCreator/rsync.nvim",
    build = "make",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("rsync").setup()
    end,
  },
}
