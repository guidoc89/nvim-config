-- local status, git = pcall(require, "git")
-- if (not status) then return end

require('git').setup({
    -- target_branch = 'master',
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    quit_blame = 'q',
    -- Open file/folder in git repository
    browse = "<Leader>go",
  }
})
