{ ... }:
let
  icons = import ../lib/icons.nix;
in
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

        glyphs = {
          # git = {
          #   unstaged = "${icons.git.FileUnstaged}";
          #   staged = "${icons.git.FileStaged}";
          #   unmerged = "${icons.git.FileUnmerged}";
          #   renamed = "${icons.git.FileRenamed}";
          #   untracked = "${icons.ui.lazy.not_loaded}";
          #   deleted = "${icons.git.FileDeleted}";
          #   ignored = "${icons.git.FileIgnored}";
          # };
        };
      };
    };

    diagnostics = {
      enable = true;
      showOnDirs = true;
      showOnOpenDirs = true;
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
