{
  plugins.cmp = {
    enable = true;
    autoEnableSource = true;
    sources = [
      { name = "nvim_lsp"; }
      { name = "path"; }
      { name = "buffer"; }
    ];
    
    mapping = {
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "<Tab>" = {
        action = ''
          function(fallback) 
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end
        '';
        modes = [ "i" "s" ];
      };
    };
  };
}
