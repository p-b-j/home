{
  config,
  lib,
  pkgs,
  username,
  ...
}:
{
  home.packages = with pkgs; [
    aerospace
  ];
  home.homeDirectory = "/Users/${username}";
  home.file."Applications/home-manager".source =
    let
      apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
    in
    lib.mkIf pkgs.stdenv.targetPlatform.isDarwin "${apps}/Applications";
}
