local function grep_string()
  local builtin = require('telescope.builtin')
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end

local function live_grep()
  local builtin = require('telescope.builtin')
  builtin.live_grep();
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.0",
  dependencies = {{ "nvim-lua/plenary.nvim" }, { "nvim-tree/nvim-web-devicons" }},
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>" },
    { "<leader>fs", grep_string },
    { "<leader>fl", live_grep }
  },
  config = function() 
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending"
      },
    })
  end
}
