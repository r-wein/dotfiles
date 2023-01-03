return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = true,
  },
  { 
    'sindrets/diffview.nvim', 
    event = "BufReadPre",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
  }
}
