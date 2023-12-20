---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<D-a>"] = { "ggVG", "Select All" },
    ["<leader>rr"] = { "<cmd> RustRun <CR>", "Rust Run" },
    ["<leader>rt"] = { "<cmd> RustTest <CR>", "Rust Test" },
    ["<leader>rta"] = { "<cmd> RustTest! <CR>", "Rust Test All" },
    ["<M-k>"] = { "kddpk", "move up one line" },
    ["<M-j>"] = { "ddp", "move down one line" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<D-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<M-k>"] = { "m1dkPm`V`1kk", "move up mulit line" },
    ["<M-j>"] = { "djm`Pgv<Esc>jv``kV", "move down mulit line" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<C-s>"] = { "<cmd> w <CR><ESC>", "Save file" },
    ["<D-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<D-a>"] = { "<ESC>ggVG", "Select All" },
    ["<M-k>"] = { "<Esc>kddpk", "move up one line" },
    ["<M-j>"] = { "<Esc>ddp", "move down one line" },
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
