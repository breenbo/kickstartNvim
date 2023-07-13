--
--
--
return {
  "vuki656/package-info.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "BufRead package.json",
  config = function()
    require("package-info").setup()
    -- Show dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>ps",
      require("package-info").show,
      { silent = true, noremap = true, desc = "Package info show" }
    )

    -- Hide dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>pc",
      require("package-info").hide,
      { silent = true, noremap = true, desc = "Package info hide" }
    )

    -- Toggle dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>pt",
      require("package-info").toggle,
      { silent = true, noremap = true, desc = "Package info toggle" }
    )

    -- Update dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>pu",
      require("package-info").update,
      { silent = true, noremap = true, desc = "Package update" }
    )

    -- Delete dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>pd",
      require("package-info").delete,
      { silent = true, noremap = true, desc = "Package delete" }
    )

    -- Install a new dependency
    vim.keymap.set(
      { "n" },
      "<LEADER>pi",
      require("package-info").install,
      { silent = true, noremap = true, desc = "Package install" }
    )

    -- Install a different dependency version
    vim.keymap.set(
      { "n" },
      "<LEADER>pp",
      require("package-info").change_version,
      { silent = true, noremap = true, desc = "Package change version" }
    )
  end,
}
