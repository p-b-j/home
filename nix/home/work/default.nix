{ lib, pkgs, ... }:
let
  shortcut-mcp-server = pkgs.callPackage ./packages/shortcut-mcp-server/package.nix { };
in
{
  home.packages = [
    shortcut-mcp-server
    pkgs._1password-cli
    pkgs.gws
  ];
  home.sessionPath = [ "$HOME/.local/bin" ];
}
