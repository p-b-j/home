{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    alacritty
    fontconfig
    nerd-fonts.sauce-code-pro
  ];
  fonts.fontconfig.enable = true;
}
