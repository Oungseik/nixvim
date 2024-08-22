{
  plugins = {
    which-key.enable = true;
    nvim-autopairs.enable = true;
  };

  imports = [ ./flash.nix ./markview.nix ./toggleterm.nix ];
}
