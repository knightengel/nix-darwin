{ config, pkgs, ... }:

{
  nix-homebrew = {
   enable = true;
   enableRosetta = true;
   user = "engel";
   autoMigrate = true;
  };


  homebrew = {
    enable = true;
    brews = [ 
      "mas"
      "cava"
      "python3"
    ];
    casks = [
      "soulseek"
    ];
    masApps = {

    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}

