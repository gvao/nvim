-- Atalhos gerais do Neovim

-- Tecla Leader: Espaço
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Limpar destaque de busca com ESC
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Limpar destaque da busca" })

-- Salvar e fechar arquivos rapidamente
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Salvar arquivo" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Fechar buffer/janela" })

-- Navegação simplificada entre janelas divididas (splits)
keymap("n", "<C-h>", "<C-w>h", { desc = "Mover para janela da esquerda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Mover para janela abaixo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Mover para janela acima" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Mover para janela da direita" })

-- Mover linhas selecionadas no modo visual para cima/baixo (Alt+j / Alt+k)
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })
