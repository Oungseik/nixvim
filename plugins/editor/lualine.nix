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
      ];

      lualine_c = [
        {
          name = "diff";
          extraConfig = {
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          };
        }
      ];

      # right 
      lualine_x = [
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

      lualine_y = [{
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
      }];
      lualine_z = [{ name = "location"; }];
    };
  };
}
