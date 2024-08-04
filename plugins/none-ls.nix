{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = false;
    settings = {
      updateInInsert = true;
    };
    sources = {
      code_actions = {
        gitsigns.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        yamllint.enable = true;
      };
      formatting = {
        nixpkgs_fmt.enable = true;
        black = {
          enable = true;
          settings = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
          settings = ''
            {
              extra_args = { "--print-width", 100, "--trailing-comma", "all" },
            }
          '';
        };
        stylua.enable = true;
        yamlfmt.enable = true;
      };
    };
  };
  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<leader>lf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
