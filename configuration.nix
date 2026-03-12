{ ... }:

{
  imports = [
    ./brew.nix
    ./modules/darwin/system.nix
    ./modules/darwin/yabai.nix
    ./modules/darwin/skhd.nix
    ./modules/darwin/borders.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.engel = import ./home.nix;
  };
}
