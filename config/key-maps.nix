{
  globals.mapleader = " ";

  keymaps = [
    { mode = "n"; key = "<leader>e"; options.silent = true; action = "<cmd>Neotree position=right toggle<CR>"; }
    { mode = "n"; key = "<leader>a"; options.silent = true; action = "<cmd>Arrow open<CR>"; }

    { mode = "n"; key = "<S-h>"; options.silent = true; action = "<cmd>BufferLineCyclePrev<CR>"; }
    { mode = "n"; key = "<S-l>"; options.silent = true; action = "<cmd>BufferLineCycleNext<CR>"; }



    { mode = "n"; key = "<leader>q"; options.silent = true; action = "<cmd>q<CR>"; }
    { mode = "n"; key = "<leader>w"; options.silent = true; action = "<cmd>w<CR>"; }
  ];
}
