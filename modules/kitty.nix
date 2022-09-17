{ config, pkgs, home, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "Inconsolata Nerd Font";
      package = pkgs.inconsolata-nerdfont;
      size = 11;
    };
    settings = {
      update_check_interval = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
    theme = "Gruvbox Material Dark Hard";
  };
}
