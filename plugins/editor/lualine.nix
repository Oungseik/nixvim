{
  plugins.lualine = {
    enable = true;

    componentSeparators = {
      right = "";
      left = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };

    globalstatus = true;
    extensions = [ "fzf" "neo-tree" ];
    disabledFiletypes = { statusline = [ "startup" "alpha" "NvimTree" ]; };
    theme = "catppuccin";

    sections = {
      lualine_a = [
        {
          name = "mode";
          extraConfig = {
            icon_only = true;
          };
        }
      ];
      lualine_b = [
        {
          name = "branch";
          icon = "";
        }
        # {
        #   name = "diff";
        #   extraConfig = {
        #     symbols = {
        #       added = " ";
        #       modified = " ";
        #       removed = " ";
        #     };
        #   };
        # }
      ];

      lualine_c = [
        {
          fmt.__raw = ''
            function()
              local buf_clients = vim.lsp.get_clients { bufnr = 0 }
              if #buf_clients == 0 then
                return "LSP Inactive"
              end

              local buf_ft = vim.bo.filetype
              local buf_client_names = {}

              -- add client
              for _, client in pairs(buf_clients) do
                if client.name ~= "null-ls" and client.name ~= "copilot" then
                  table.insert(buf_client_names, client.name)
                end
              end

              local unique_client_names = table.concat(buf_client_names, ", ")
              local language_servers = string.format("  %s", unique_client_names)

              return language_servers
            end,
          '';
          color = {
            fg = "#c6a0f6";
          };
        }
        {
          name = "diagnostics";
          extraConfig = {
            sources = [ "nvim_lsp" ];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          };
        }
      ];

      # right 
      lualine_x = [
        {
          name = "filetype";
          extraConfig = {
            icon_only = true;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          };
        }
        {
          name = "filename";
          extraConfig = {
            path = 0;
          };
        }
        { name = "navic"; }
        {
          name.__raw = ''
            function()
              local icon = " "
              local status = require("copilot.api").status.data
              return icon .. (status.message or " ")
            end,

            cond = function()
             local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
             return ok and #clients > 0
            end,
          '';
        }
      ];

      lualine_y = [
        { name = "progress"; }
      ];
      lualine_z = [{ name = "location"; }];
    };
  };
}
