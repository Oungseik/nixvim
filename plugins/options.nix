{
  plugins.tmux-navigator.enable = true;
  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "macchiato";
  };

  extraConfigLuaPre = ''
    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
  '';

  extraConfigLua = ''
    -- auto-reload files when modified externally
    -- https://unix.stackexchange.com/a/383044
    vim.o.autoread = true
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
      command = "if mode() != 'c' | checktime | endif",
      pattern = { "*" },
    })

  '';

  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
    providers.xsel.enable = true;
  };

  opts = {
    number = true;
    relativenumber = false;
    termguicolors = true;
    showmode = false;
    splitbelow = true;
    splitkeep = "screen";
    splitright = true;
    scrolloff = 8;
    foldmethod = "manual";
    foldenable = false;
    linebreak = true;
    cursorline = true;
    signcolumn = "yes";
    ignorecase = true;

    wrap = false;

    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = true;
    breakindent = true;
  };
}
