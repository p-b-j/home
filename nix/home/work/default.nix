{ lib, pkgs, ... }:
let
  shortcut-mcp-server = pkgs.callPackage ./packages/shortcut-mcp-server/package.nix { };
in
{
  home.packages = [
    shortcut-mcp-server
  ];
  home.sessionPath = [ "$HOME/.local/bin" ];
}
