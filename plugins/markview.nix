{ pkgs, ... }: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "markview.nvim";
      version = "0.0.1";
      src = pkgs.fetchFromGitHub {
        owner = "OXY2DEV";
        repo = "markview.nvim";
        rev = "a959d77ca7e9f05175e3ee4e582db40b338c9164";
        hash = "sha256-w6yn8aNcJMLRbzaRuj3gj4x2J/20wUROLM6j39wpZek=";
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
