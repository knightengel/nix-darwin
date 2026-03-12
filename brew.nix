{ ... }:

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
      "Telegram" = 747648890;
      "V2Box" = 6446814690;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}

