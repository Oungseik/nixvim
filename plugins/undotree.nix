{
  plugins.undotree = {
    enable = true;
    settings = {
      autoOpenDiff = true;
      focusOnToggle = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>U";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Undotree";
      };
    }
  ];
}
