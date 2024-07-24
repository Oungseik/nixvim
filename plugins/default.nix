{
  imports = [
    ./autopairs.nix
    ./bufferline.nix
    ./cmp.nix
    ./comment.nix
    ./ftplugins.nix
    ./gitsigns.nix
    ./keymaps.nix
    ./lsp.nix
    ./lualine.nix
    ./markview.nix
    # ./neo-tree.nix
    (import ./nvim-tree.nix { })
    ./none-ls.nix
    ./nvim-ufo.nix
    ./options.nix
    ./schemastore.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    # ./undotree.nix
    ./which-key.nix
  ];
}
