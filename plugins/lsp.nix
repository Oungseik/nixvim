# checkout https://github.com/dc-tec/nixvim/blob/21072b364c6b8627cbb7a360556eadb3f3a8d412/config/plugins/lsp/lsp.nix
{
  # diagnostics.virtual_lines.only_current_line = true;
  diagnostics.virtual_lines = false;
  diagnostics.virtual_text = true;

  plugins = {
    lsp-lines.enable = true;
    lsp-format.enable = true;
    # helm.enable = true;

    lsp = {
      enable = true;

      servers = {
        rust-analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
          settings = {
            diagnostics.enable = true;
            # diagnostics.experimental.enable = true;
          };
        };

        lua-ls = {
          enable = true;
          settings.diagnostic.globals = [ "vim" ];
        };

        cssls.enable = true;
        gopls.enable = true;
        marksman.enable = true;
        nil-ls.enable = true;
        tsserver.enable = true;
        jsonls.enable = true;
        pyright.enable = true;
        zls.enable = true;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          "<leader>lR" = {
            action = "references";
            desc = "Goto References";
          };
          "<leader>ld" = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          "<leader>li" = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          "<leader>lt" = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>lS" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>ls" = {
            action = "document_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>lw" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "<leader>lj" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "<leader>lk" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';

  keymaps = [
    {
      mode = "n";
      key = "<Leader>l";
      action = "<Nop>";
      options = { silent = true; desc = "+LSP"; };
    }
    {
      mode = [ "n" "v" ];
      key = "<leader>lq";
      action = ":lua vim.diagnostic.setloclist()<cr>";
      options = {
        silent = true;
        desc = "Quickfix";
      };
    }
  ];
}
