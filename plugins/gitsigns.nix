{
  plugins.gitsigns = {
    enable = true;

    settings = {
      trouble = false;
      current_line_blame = false;
      signs = {
        delete.text = "";
        topdelete.text = "";
      };
    };
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>gj";
      action = ":Gitsigns nav_hunk next<cr>";
      options = { silent = true; desc = "Next Hunk"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gk";
      action = ":Gitsigns nav_hunk prev<cr>";
      options = { silent = true; desc = "Prev Hunk"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gl";
      action = ":Gitsigns blame_line<cr>";
      options = { silent = true; desc = "Blame"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gL";
      action = ":Gitsigns blame_line full=true<cr>";
      options = { silent = true; desc = "Blame (full)"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gp";
      action = ":Gitsigns preview_hunk<cr>";
      options = { silent = true; desc = "Preview"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gr";
      action = ":Gitsigns reset_hunk<cr>";
      options = { silent = true; desc = "Reset Hunk"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gR";
      action = ":Gitsigns reset_buffer<cr>";
      options = { silent = true; desc = "Reset Buffer"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gs";
      action = ":Gitsigns stage_hunk<cr>";
      options = { silent = true; desc = "Stage Hunk"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gu";
      action = ":Gitsigns undo_stage_hunk<cr>";
      options = { silent = true; desc = "Unstage Hunk"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>go";
      action = ":Telescope git_status<cr>";
      options = { silent = true; desc = "Open Changed Files"; };
    }
    {
      mode = [ "n" ];
      key = "<leader>gd";
      action = ":Gitsigns diffthis<cr>";
      options = { silent = true; desc = "Git Diff"; };
    }
  ];
}
