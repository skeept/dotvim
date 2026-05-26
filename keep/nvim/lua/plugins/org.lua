return {
  {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    enabled = (vim.uv or vim.loop).os_uname().sysname == "Linux",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/notes/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })
    end,
  },
}
