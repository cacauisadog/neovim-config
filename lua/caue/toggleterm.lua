local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 80,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", count = 10 })
function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local django = Terminal:new({ dir = "/Users/cacauisadog/Buser/code/buser_django", cmd = "./manage.py runserver", hidden = false, direction = "vertical", count = 11})
function _DJANGO_TOGGLE()
    django:toggle()
end

local bfp = Terminal:new({ dir = "/Users/cacauisadog/Buser/code/buser_django/front", cmd = "fnm use && npm run dev:disable-mock", hidden = true, direction = "vertical", count = 12 })
function _BFP_TOGGLE()
    bfp:toggle()
end

local bfm = Terminal:new({ dir = "/Users/cacauisadog/Buser/code/buser_django/front", cmd = "fnm use && npm run dev", hidden = true, direction = "vertical", count = 13 })
function _BFM_TOGGLE()
    bfm:toggle()
end

local bcp = Terminal:new({ dir = "/Users/cacauisadog/Buser/code/staff_bx_temporario", cmd = "fnm use && PORT=3007 API_MOCK=0 npm run dev", hidden = true, direction = "vertical", count = 14 })
function _BCP_TOGGLE()
    bcp:toggle()
end

local bcm = Terminal:new({ dir = "/Users/cacauisadog/Buser/code/staff_bx_temporario", cmd = "fnm use && PORT=4007 npm run dev", hidden = true, direction = "vertical", count = 15 })
function _BCM_TOGGLE()
    bcm:toggle()
end

local bsp = Terminal:new({ dir = "/Users/cacauisadog/Buser/code/buser_staff/staff", cmd = "fnm use && PORT=3003 API_MOCK=0 npm run dev", hidden = true, direction = "vertical", count = 16 })
function _BSP_TOGGLE()
    bsp:toggle()
end

local bsm = Terminal:new({ dir = "/Users/cacauisadog/Buser/code/buser_staff/staff", cmd = "fnm use && PORT=4003 npm run dev", hidden = true, direction = "vertical", count = 17 })
function _BSM_TOGGLE()
    bsm:toggle()
end
