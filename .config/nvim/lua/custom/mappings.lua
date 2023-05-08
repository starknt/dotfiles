local M = {}

M.crates = {
  plugin = true,

  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update all crates"
    }
  }
}

M.nvterm = {
  plugin = true,

  n = {
    ["<C-`>"] = {
      function ()
        require('nvterm.terminal').toggle "horizontal"
      end,
      "toggle horizontal term"
    }
  }
}

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

return M
