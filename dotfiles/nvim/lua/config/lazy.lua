local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local lockfile = vim.fn.stdpath("state") .. "/lazy/lazy-lock.json"

require("lazy").setup({
  { import = "config.plugins" },
}, {
  lockfile = lockfile,
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  install = {
    colorscheme = { "rose-pine" },
  },
})
