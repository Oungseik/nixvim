{ pkgs, ... }: {
  plugins.markview.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<Leader>pm";
      action = "<Nop>";
      options = { silent = true; desc = "+Markdown"; };
    }
    {
      mode = "n";
      key = "<Leader>pmt";
      action = ":Markview toggle<CR>";
      options = { silent = true; desc = "+Markdown"; };
    }
  ];
}
