return {
  { "wakatime/vim-wakatime", lazy = false },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
