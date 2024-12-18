return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})

    require("neo-tree").setup({
      default_component_configs = {
        file_size = {
          enabled = true,
          required_width = 10,
        },
      },
    })
  end

}
