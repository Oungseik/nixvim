{ ... }:
{
  plugins.nvim-tree = {
    enable = true;
    updateFocusedFile.enable = true;

    view = {
      side = "right";
    };

    git = {
      enable = true;
    };

    actions.expandAll.exclude = [ ];

    renderer = {
      highlightGit = true;
      highlightOpenedFiles = "none";
      indentMarkers = { enable = true; };

      icons = {
        gitPlacement = "after";
        show = { file = true; folder = true; folderArrow = true; git = false; };
      };
    };

    diagnostics = {
      enable = true;
      showOnDirs = true;
      showOnOpenDirs = false;
      debounceDelay = 50;
      severity = {
        min = "error";
        max = "error";
      };
    };
  };

  globals = {
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      options.silent = true;
      options.desc = "Explorer";
      action = "<cmd>NvimTreeToggle<CR>";
    }
  ];
}
