{
  plugins.comment = {
    enable = true;
  };

  keymaps = [
    {
      mode = "v";
      key = "<leader>/";
      options.silent = true;
      options.desc = "Comment Lines";
      action = "<leader>gc";
    }
  ];
}
