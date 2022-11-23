local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--      normal_mode = "n",
--      insert_mode = "i",
--      visual_mode = "v",
--      visual_block_mode = "x",
--      term_mode = "t",
--      command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Remap save to ctrl+s
keymap("n", "<C-s>", ":w<CR>", opts)

-- Clear search highlight on enter
keymap("n", "<CR>", ":nohl<CR>", opts)

-- Close current buffer
keymap("n", "<S-q>", "<cmd>Bdelete<CR>", opts)

-- Paste from register 0 by default
keymap("n", "p", '"0p<cr>', opts)

-- Insert --
-- Remap save to ctrl+s
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<leader-j>", ":m .+1<CR>==", opts)
keymap("v", "<leader-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<leader-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<leader-k>", ":move '<-2<CR>gv-gv", opts)
