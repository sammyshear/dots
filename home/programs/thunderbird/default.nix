# thunderbird email client
{ pkgs, ... }:
{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;
    profiles = {};
  };
}
