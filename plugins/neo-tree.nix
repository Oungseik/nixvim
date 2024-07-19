{
  plugins.neo-tree = {
    enable = true;
    filesystem.filteredItems = {
      visible = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      options.silent = true;
      options.desc = "Explorer";
      action = "<cmd>Neotree position=right toggle<CR>";
    }
  ];
}
