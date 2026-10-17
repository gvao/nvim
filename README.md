# Neovim Configuration

Configuração moderna, rápida e modular para o **Neovim (v0.11+)**, com suporte completo a LSP, realce de sintaxe avançado com Treesitter e autocompletion de alta performance.

## 📦 Plugins e Recursos

- **Gerenciador de Plugins:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Syntax Highlighting & Indentação:** [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (branch `master`)
- **LSP:** [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) com auto-detecção de binários instalados no sistema
- **Autocompletar:** [blink.cmp](https://github.com/saghen/blink.cmp)

## 📁 Estrutura

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── lua/
    ├── config/
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins/
        ├── completion.lua
        ├── lsp.lua
        └── treesitter.lua
```

## 🚀 Instalação

```bash
git clone https://github.com/gvao/nvim.git ~/.config/nvim
```

Ao abrir o `nvim`, o `lazy.nvim` fará o bootstrap e a instalação automática dos plugins.
