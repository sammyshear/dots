{ pkgs, config, ... }: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/neovim
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/git/signing.nix
    ../../home/programs/spicetify
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/duckduckgo-colorscheme
    ../../home/programs/discord
    ../../home/programs/anyrun
    ../../home/programs/thunderbird
    ../../home/programs/obs

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/wofi
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      bitwarden # Password manager
      vlc # Video player
      blanket # White-noise app
      obsidian # Note taking app
      # planify # Todolists
      gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images
      resources
      gnome-clocks
      gnome-text-editor
      mpv # Video player
      figma-linux
      firefox
      prismlauncher

      # Dev
      go
      bun
      nodejs
      python3
      jq
      just
      pnpm
      air
      texlive.combined.scheme-full

      # Utils
      zip
      unzip
      optipng
      jpegoptim
      pfetch
      praat
      btop
      fastfetch
      lua51Packages.luarocks
      avidemux

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix

      # Backup
      brave
      vscode
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = { source = ./profile_picture.png; };

    # Don't touch this
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
