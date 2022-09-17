{ config, pkgs, home, ... }: {
  imports = [
    ./modules/fish.nix
    ./modules/firefox.nix
    ./modules/mpv.nix
    ./modules/kitty.nix
  ];
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    btop
    ffmpeg
    tdesktop
    gnome.gnome-tweaks
    yt-dlp
    ripgrep
    neovim
    wget
    ripgrep-all
    curl
    aria
    rnix-lsp
    nixpkgs-fmt
    tokei
    neofetch
    hyperfine
    tree
  ];

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.bat.enable = true;

  programs.git = {
    enable = true;
    userName = "sneedcat";
    userEmail = "sneedcat@proton.me";
    lfs.enable = true;
    delta.enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        color = "default";
        tree = true;
        dot_marker = true;
        left_legend = true;
        mem_as_value = true;
      };
    };
  };
}
