---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<D-a>"] = { "ggVG", "Select All" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<D-s>"] = { "<cmd> w <CR>", "Save file" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<C-s>"] = { "<cmd> w <CR><ESC>", "Save file" },
    ["<D-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<D-a>"] = { "<ESC>ggVG", "Select All" },
  },
}

M.comment = {
  i = {
    ["<D-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },
  n = {
    ["<D-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<D-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M
