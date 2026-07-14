{
  pkgs,
  username,
  stateVersion,
  ...
}:
{
  home.stateVersion = "${stateVersion}";
  home.username = "${username}";
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bash
    bash-completion
    clang
    clang-tools
    cmake
    curl
    direnv
    gh
    git
    go
    gopls
    gnumake
    git-lfs
    mr
    neovim
    openssl
    postgresql
    tmux

    # lsps
    lexical
    lua-language-server

    # formatters
    nixfmt-rfc-style
    stylua

    # vim deps
    ripgrep
  ];

  # I don't want my config controlled by nix... yet...
  home.file = { };
  home.sessionVariables = { };

  programs.home-manager = {
    enable = true;
  };
}
