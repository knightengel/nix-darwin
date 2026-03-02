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
    ];
    casks = [
      "soulseek"
    ];
    masApps = {
      "Paint S" = 736473980;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}

