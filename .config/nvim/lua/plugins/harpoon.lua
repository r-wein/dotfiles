local function add_file()
  local mark = require("harpoon.mark")
  mark.add_file()
end

local function nav(i)
  local ui = require("harpoon.ui")
  ui.nav_file(i)
end

local function toggle()
 local ui = require("harpoon.ui")
 ui.toggle_quick_menu()
end


local function nav_one()
  nav(1)
end

local function nav_two()
  nav(2)
end

local function nav_three()
  nav(3)
end

local function nav_four()
  nav(4)
end



return {
  "theprimeagen/harpoon",
  event = "VeryLazy",
  keys = {
    { "<leader>a", add_file },
    { "<C-e>", toggle },
    { "<C-h>", nav_one },
    { "<C-t>", nav_two },
    { "<C-n>", nav_three },
    { "<C-s>", nav_four },
  }
}
