-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.lsp.set_log_level("off")
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ extension = { pgn = "pgn" } })
vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})

vim.api.nvim_create_user_command("OpenNotebook", function()
  vim.cmd("cd " .. vim.fn.expand("~") .. "/Documents/notes")
  vim.cmd("e " .. vim.fn.expand("~") .. "/Documents/notes/Notebook.md")
  vim.cmd("RsyncDown")
end, {})
