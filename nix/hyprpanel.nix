{ inputs, ... }: {

  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {

    # Enable the module.
    # Default: false
    enable = true;

    # Automatically restart HyprPanel with systemd.
    # Useful when updating your config so that you
    # don't need to manually restart it.
    # Default: false
    systemd.enable = true;

    # Add '/nix/store/.../hyprpanel' to your
    # Hyprland config 'exec-once'.
    # Default: false
    hyprland.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    # Default: false
    overwrite.enable = true;
    settings = {
      # Import a theme from './themes/*.json'.
      # Default: ""
      theme.name = "catppuccin_mocha";
      # Configure bar layouts for monitors.
      # See 'https://hyprpanel.com/configuration/panel.html'.
      # Default: null
      layout = {
        "bar.layouts" = {
          "0" = {
            left = [ "dashboard" "workspaces" "windowtitle" ];
            middle = [ "media" ];
            right = [
              "battery"
              "network"
              "bluetooth"
              "volume"
              "systray"
              "kbinput"
              "clock"
              "notifications"
            ];
          };
        };
      };

      # Configure and theme almost all options from the GUI.
      # Options that require '{}' or '[]' are not yet implemented,
      # except for the layout above.
      # See 'https://hyprpanel.com/configuration/settings.html'.
      # Default: <same as gui>
      bar.workspaces.show_icons = false;
      bar.customModules.updates.pollingInterval = 1440000;
      menus.dashboard.powermenu.avatar.name = "Sammy Shear";
      menus.dashboard.powermenu.avatar.image =
        "/home/sammyshear/Pictures/catppuccin.png";
      menus.dashboard.shortcuts.left.shortcut1.command = "firefox";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Firefox";
      menus.dashboard.shortcuts.left.shortcut1.icon = "󰈹";
      menus.dashboard.shortcuts.left.shortcut3.command = "vesktop";
      menus.dashboard.shortcuts.left.shortcut3.tooltip = "Discord";
      bar.workspaces.show_numbered = false;
      bar.workspaces.showWsIcons = false;
      bar.workspaces.showApplicationIcons = false;
      bar.workspaces.applicationIconOncePerWorkspace = false;
      theme.bar.buttons.workspaces.smartHighlight = true;
      theme.bar.buttons.workspaces.enableBorder = false;
      bar.workspaces.ignored = "-98";
    };
  };
}
