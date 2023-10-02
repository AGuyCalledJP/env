  require('obsidian').setup({
    dir = "~/work/notes/",
    log_level = vim.log.levels.DEBUG,

    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d"
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({"open", url})  -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,

    open_app_foreground = false,

    -- Optional, by default commands like `:ObsidianSearch` will attempt to use
    -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
    -- first one they find. By setting this option to your preferred
    -- finder you can attempt it first. Note that if the specified finder
    -- is not installed, or if it the command does not support it, the
    -- remaining finders will be attempted in the original order.
    finder = "telescope.nvim",

    -- Optional, determines whether to open notes in a horizontal split, a vertical split,
    -- or replacing the current buffer (default)
    -- Accepted values are "current", "hsplit" and "vsplit"
    open_notes_in = "current"
})

vim.keymap.set("n", "<leader>on", ":ObsidianNew ", {})
vim.keymap.set("n", "<leader>obl", ":ObsidianBacklinks<cr>", {})
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<cr>", {})
vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<cr>", {})
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
