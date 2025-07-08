{
  services.xserver = {
    enable = true;
    xkb = {
      extraLayouts = {
        yi = {
          description = "phonetic yiddish keyboard layout";
          languages = [ "yid" ];
          symbolsFile = ./yi;
        };
        ipa = {
          description = "ipa keyboard layout";
          languages = [ "eng" ];
          symbolsFile = ./ipa;
        };
      };
      layout = "us,ipa,yi";
      options = "grp:win_space_toggle";
    };
  };
}
