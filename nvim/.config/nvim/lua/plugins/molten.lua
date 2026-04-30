return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- Mengunci di versi stabil
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
      -- Integrasi dengan image.nvim agar grafik muncul di Kitty
      vim.g.molten_image_provider = "none"

      -- Pengaturan tampilan jendela output
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true -- Menampilkan output pendek di sebelah kode

      -- Shortcut eksekusi (mirip Shift+Enter di Colab)
      vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Init Molten (Jupyter)" })
      vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", { desc = "Evaluate Operator" })
      vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { desc = "Evaluate Line" })
      vim.keymap.set("v", "<leader>e", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Evaluate Visual" })
      vim.g.python3_host_prog = vim.fn.expand("~/.nvim-venv/bin/python3")
    end,
  },
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- Sangat krusial untuk terminalmu
      max_width = 100,
      max_height = 12,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    },
  },
}
