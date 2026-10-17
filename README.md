# Neovim Configuration

Configuração moderna, ultra leve e modular para o **Neovim**, com suporte a LSP, autocompletion e destaque de sintaxe nativo (sem dependência de compiladores C ou plugins pesados).

## 📦 Plugins e Recursos

- **Gerenciador de Plugins:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Syntax Highlighting:** Nativo do Neovim (`syntax on`), leve e rápido para qualquer ambiente (Linux, Termux, etc.)
- **LSP:** [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) com detecção automática dos servidores instalados
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
        └── lsp.lua
```

## 🚀 Instalação

```bash
git clone https://github.com/gvao/nvim.git ~/.config/nvim
```

Ao abrir o `nvim`, o `lazy.nvim` fará o bootstrap e a instalação automática dos plugins.
