{ pkgs, ... }: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "markview.nvim";
      version = "0.0.1";
      src = pkgs.fetchFromGitHub {
        owner = "OXY2DEV";
        repo = "markview.nvim";
        rev = "316cafc79490f8b79c288bbe6638838d6d68e227";
        hash = "sha256-4fXdQWQwmMkzBIkXFvBlV352k6Df7LR4ib6wZhK7rfo=";
      };
    })
  ];

  extraConfigLua = ''
    require("markview").setup();
  '';

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
      action = ":Markview<CR>";
      options = { silent = true; desc = "+Markdown"; };
    }
  ];
}
