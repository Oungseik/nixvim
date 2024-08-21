{
  imports = [
    ./autopairs.nix
    ./bufferline.nix
    ./cmp.nix
    ./comment.nix
    ./flash.nix
    ./ftplugins.nix
    ./gitsigns.nix
    ./keymaps.nix
    ./lsp.nix
    ./lualine.nix
    ./markview.nix
    ./none-ls.nix
    (import ./nvim-tree.nix { })
    ./options.nix
    ./schemastore.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./which-key.nix
  ];
}
