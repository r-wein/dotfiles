local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("config.plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  diff = {
    cmd = "terminal_git",
  },
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "netrwPlugin",
        "zipPlugin",
        "nvim-treesitter-textobjects",
      },
    },
  },
  ui = {
    custom_keys = {

      ["<localleader>d"] = function(plugin)
        dd(plugin)
      end,
    },
  },
  debug = true,
})
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")
