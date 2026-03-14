{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };

  home.packages = with pkgs; [
    git
    gcc
    ripgrep
    fd
    unzip

    lua-language-server
    basedpyright
    typescript-language-server
    vscode-langservers-extracted
    bash-language-server
    gopls
    rust-analyzer

    stylua
    prettierd
    black
    isort
    shfmt
  ];

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
