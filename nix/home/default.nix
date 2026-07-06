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
    curl
    direnv
    _1password-cli
    gh
    git
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
