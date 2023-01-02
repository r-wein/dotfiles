return {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  config = function ()
    require('copilot').setup({
      suggestion = {
        auto_trigger = true
      }
    })
  end,
}
