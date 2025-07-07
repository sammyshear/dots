# Neovim Config
_: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = false;
    defaultEditor = true;
  };
  home.file."./.config/nvim/" = {
    source = ../../../config/nvim;
    recursive = true;
  };
}
