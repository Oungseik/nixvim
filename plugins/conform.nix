{
  plugins.conform-nvim = {
    enable = true;

    formatOnSave = true;

    formattersByFt = {
      lua = [ "stylua" ];
      python = [ [ "isort" "black" ] ];
      javascript = [ [ "biome" "prettierd" "prettier" ] ];
      rust = [ "rust-analyzer" ];
    };
  };
}
