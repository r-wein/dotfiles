return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {{ "nvim-tree/nvim-web-devicons" }},
  tag = "nightly",
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false
      }
    })
  end,
  keys = {
    { "<leader>pv", "<cmd>NvimTreeToggle<cr>" }
  }
}
