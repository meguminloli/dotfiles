{
  description = "NixOS system-wide configuration";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = github:nix-community/NUR;
  };
  outputs = { self, nixpkgs, home-manager, nur }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    nixosConfigurations.computer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [
            nur.overlay
            (self: super: {
              mpv = super.mpv-with-scripts.override {
                scripts = with self; [ mpvScripts.mpris mpvScripts.autoload mpvScripts.thumbnail mpvScripts.mpv-playlistmanager ];
              };
            })
          ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.subhuman = import ./home.nix;
        }
      ];
    };
  };
}
