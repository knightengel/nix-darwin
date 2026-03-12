{ config, lib, pkgs, ... }:

{
  imports = [
    ./brew.nix
    ./modules/darwin/system.nix
    ./modules/darwin/yabai.nix
    ./modules/darwin/skhd.nix
    ./modules/darwin/borders.nix
  ];

   nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "engel" ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.engel = import ./home.nix;
  };
}
