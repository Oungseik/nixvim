{
  globals.mapleader = " ";
  keymaps = [
    {
      mode = "n";
      key = "<Leader>p";
      action = "<Nop>";
      options = { silent = true; desc = "+Plugins More"; };
    }

    # utility
    {
      mode = "n";
      key = "<leader>q";
      options.silent = true;
      options.desc = "Quit";
      action = "<cmd>q<CR>";
    }
    {
      mode = "n";
      key = "<leader>w";
      options.silent = true;
      options.desc = "Save";
      action = "<cmd>noa w<CR>";
    }
    {
      mode = "n";
      key = "<leader>h";
      options.silent = true;
      options.desc = "No Highlight";
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "n";
      key = "<C-l>";
      options.silent = true;
      action = "<C-w>l";
    }
    {
      mode = "n";
      key = "<C-h>";
      options.silent = true;
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "<C-j>";
      options.silent = true;
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "<C-k>";
      options.silent = true;
      action = "<C-w>k";
    }

    { mode = "n"; key = "<A-j>"; action = ":m .+1<CR>=="; }
    { mode = "n"; key = "<A-k>"; action = ":m .-2<CR>=="; }

    # insert mode bindings
    {
      mode = "i";
      key = "<C-l>";
      options.silent = true;
      action = "<End>";
    }

    # visual mode bindings
    { mode = "v"; key = ">"; action = ">gv"; }
    { mode = "v"; key = "<"; action = "<gv"; }
    { mode = "v"; key = "<A-j>"; action = ":m '>+1<CR>gv=gv"; }
    { mode = "v"; key = "<A-k>"; action = ":m '<-2<CR>gv=gv"; }
  ];
}
