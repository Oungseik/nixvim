{
  plugins.rustaceanvim = {
    enable = true;
    rustAnalyzerPackage = null;

    settings = {
      server.default_settings.rust-analyzer.diagnostics = {
        enable = false;
        experimental.enable = false;
      };
    };
  };
}
