local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- Lua
  b.formatting.stylua,

  -- rust
  b.formatting.rustfmt.with({
    extra_args = function(params)
        local Path = require("plenary.path")
        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

        if cargo_toml:exists() and cargo_toml:is_file() then
            for _, line in ipairs(cargo_toml:readlines()) do
                local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                if edition then
                    return { "--edition=" .. edition }
                end
            end
        end
        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
        return { "--edition=2021" }
    end,
  })
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,

}
