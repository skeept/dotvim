return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local is_windows = (vim.uv or vim.loop).os_uname().sysname:find("Windows")
      if is_windows and opts.servers then
        -- Keep your rule disabling pyright on Windows
        opts.servers.pyright = nil

        local home_dir = vim.fn.expand("~"):lower():gsub("\\", "/")

        for _, server_opts in pairs(opts.servers) do
          if type(server_opts) == "table" then
            local original_root_dir = server_opts.root_dir

            server_opts.root_dir = function(fname, buf)
              -- 1. Always prioritize bounded, explicit local project trees
              local has_project_anchor = vim.fs.root(
                buf,
                { ".git", "package.json", "pyproject.toml", "Cargo.toml", "init.lua" }
              )
              if has_project_anchor then
                return has_project_anchor
              end

              -- 2. If no clear project file exists, check where the server wants to default to
              local root = original_root_dir and original_root_dir(fname, buf) or vim.fn.getcwd()

              if root then
                local normalized_root = root:lower():gsub("\\", "/")

                -- 3. Catch if the root is the Home folder OR anywhere inside your OneDrive directory
                if normalized_root == home_dir or normalized_root:find("onedrive") then
                  -- Returning nil safely forces the LSP into "single-file mode",
                  -- completely killing the background file-indexing download storm.
                  return nil
                end
              end
              return root
            end
          end
        end
      end
    end,
  },
}
