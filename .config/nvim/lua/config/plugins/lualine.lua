local function clock()
  return " " .. os.date("%H:%M")
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {{ "SmiteshP/nvim-navic" }},
  config = function ()
   require("lualine").setup({
    options = {
      theme = "auto",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      icons_enabled = true,
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "lazy" } },
    },
    sections = {
      lualine_a = { { "mode" } },
      lualine_b = { "branch" },
      lualine_c = {
        { "diagnostics", sources = { "nvim_diagnostic" } },
        { "filetype", icon_only = true },
        { "filename", path = 1, symbols = { modified = "  ", readonly = " ", unnamed = " " } },
        {
          function()
            local navic = require("nvim-navic")
            local ret = navic.get_location()
            return ret:len() > 2000 and "navic error" or ret
          end,
          cond = function()
            if package.loaded["nvim-navic"] then
              local navic = require("nvim-navic")
              return navic.is_available()
            end
          end,
          color = { fg = "#f6c177" },
        },
      },
      lualine_x = {
        {
          function()
            return require("noice").api.status.command.get()
          end,
          cond = function()
            if package.loaded["noice"] then
              return require("noice").api.status.command.has()
            end
          end,
          color = { fg = "#f6c177" },
        },
        {
          function()
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            if package.loaded["noice"] then
              return require("noice").api.status.mode.has()
            end
          end,
          color = { fg = "#f6c177" },
        },
        {
          function()
            return require("noice").api.status.search.get()
          end,
          cond = function()
            if package.loaded["noice"] then
              return require("noice").api.status.search.has()
            end
          end,
          color = { fg = "#f6c177" },
        },
        {
          function()
            return require("lazy.status").updates()
          end,
          cond = require("lazy.status").has_updates,
          color = { fg = "#f6c177" },
        },
        {
          function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "" .. ms .. "ms"
          end,
          color = { fg = "#f6c177" },
        },
      },
      lualine_y = { "location" },
      lualine_z = { { clock } },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    -- winbar = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = { "filename" },
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
    --
    -- inactive_winbar = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = { "filename" },
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
  })
end
}
