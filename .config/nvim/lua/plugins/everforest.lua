return {
  "sainnhe/everforest", -- https://github.com/sainnhe/everforest/blob/master/doc/everforest.txt
  lazy = false,
  priority = 2000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    --   vim.g.everforest_background = "hard"
    --   vim.g.everforest_cursor = "green"
    --   vim.g.everforest_enable_italic = true
    vim.g.everforest_current_word = "none"
    vim.cmd.colorscheme "everforest"
  end,
}
