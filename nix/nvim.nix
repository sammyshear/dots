{config, pkgs, ...}:
{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      -- lua config here
      ${builtins.readFile ../config/nvim/init.lua}
    '';
  };
}
