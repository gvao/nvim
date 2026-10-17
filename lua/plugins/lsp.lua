return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- Atalhos ativados apenas quando um servidor LSP estiver conectado ao buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Ir para Definição")
          map("gD", vim.lsp.buf.declaration, "Ir para Declaração")
          map("gi", vim.lsp.buf.implementation, "Ir para Implementação")
          map("K", vim.lsp.buf.hover, "Exibir Documentação")
          map("<leader>rn", vim.lsp.buf.rename, "Renomear Símbolo")
          map("<leader>ca", vim.lsp.buf.code_action, "Ações de Código")
          map("<leader>d", vim.diagnostic.open_float, "Ver Detalhes do Erro/Diagnóstico")
          map("[d", vim.diagnostic.goto_prev, "Diagnóstico Anterior")
          map("]d", vim.diagnostic.goto_next, "Próximo Diagnóstico")
        end,
      })

      -- Configuração visual dos diagnósticos (ícones e bordas)
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Capacidades do blink.cmp para habilitar auto-completar rico no LSP
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Lista de servidores desejados
      local servers = {
        "lua_ls",
        "ts_ls",
        "jsonls",
        "yamlls",
        "dockerls",
        "bashls",
        "gopls",
      }

      -- Mapeamento dos servidores para os respectivos nomes de seus binários executáveis no sistema
      local server_binaries = {
        lua_ls = "lua-language-server",
        ts_ls = "typescript-language-server",
        jsonls = "vscode-json-language-server",
        yamlls = "yaml-language-server",
        dockerls = "docker-langserver",
        bashls = "bash-language-server",
        gopls = "gopls",
      }

      local lspconfig = require("lspconfig")

      for _, server in ipairs(servers) do
        local bin = server_binaries[server] or server

        -- Blindagem: só habilita o LSP se o binário existir no PATH do sistema
        if vim.fn.executable(bin) == 1 then
          local opts = {
            capabilities = capabilities,
          }

          if server == "lua_ls" then
            opts.settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            }
          end

          -- Se a nova API nativa vim.lsp.config do Neovim 0.11+ existir, usa ela:
          if vim.lsp.config then
            vim.lsp.config(server, opts)
            vim.lsp.enable(server)
          else
            lspconfig[server].setup(opts)
          end
        end
      end
    end,
  },
}
