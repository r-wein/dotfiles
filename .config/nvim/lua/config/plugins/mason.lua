local tools = {
  "prettierd",
  "stylua",
  "selene",
  "luacheck",
  "eslint_d",
  "shfmt",
  "black",
  "isort",
  "flake8",
  "rustfmt",
}

local function check()
  local mr = require("mason-registry")
  for _, tool in ipairs(tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end


return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim"
  },
  config = function()
    require("mason").setup()
    check()
 
    require("mason-lspconfig").setup({
      ensure_installed = {
        "rust_analyzer",
        "sumneko_lua",
        "tsserver",
        "taplo",
        "yamlls",
        "pyright",
        "html",
        "tailwindcss"
      },
      automatic_installation = false,
    })
  end,
}

