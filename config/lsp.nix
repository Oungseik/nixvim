{
  plugins.lsp = {
    enable = true;

    servers = { 

      # Rust
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
    };
  };
}
