{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    git
    ripgrep
    fd
    gcc
    unzip
    stylua
    lua-language-server
    nil
    nixd
    nodejs
  ];

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
