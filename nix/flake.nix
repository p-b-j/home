{
  # All Flakes have: description, inputs, and outputs attributes
  description = "Home Manager configurations";

  inputs = {
    # As opposed to nix-channels, I can specify an arbitrary number of named
    # nixpkgs references depending on my needs. Unsure if nixos-unstable is
    # the branch I want to follow at the moment.
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Here is how I input my home-manager version and instruct home-manager to
    # use the same nixpkgs input as this flake. I'm unsure if this is a good
    # practice because now I may introduce a combination of home-manager and
    # nixpkgs that's never been tested together.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # The ... is because "self" is also passed in, but I'm choosing to ignore
  # it since the linter complains that it's never referenced.
  # The "let" keyword allows the ability to define variables to be accessed in
  # scope of the expression after the "in" keyword
  outputs =
    { nixpkgs, home-manager, ... }:
    {
      # The arguments to homeManagerConfiguration are:
      # {
      #   modules ? [ ],
      #   pkgs,
      #   lib ? pkgs.lib,
      #   extraSpecialArgs ? { },
      #   check ? true,
      #   # Deprecated:
      #   configuration ? null,
      # }
      # src: https://github.com/nix-community/home-manager/blob/da282034f4d30e787b8a10722431e8b650a907ef/lib/default.nix#L4-L13
      homeConfigurations = {
        "linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
          extraSpecialArgs = {
            username = "pbj";
            stateVersion = "25.11";
          };
          modules = [
            ./home
            ./home/linux
            ./home/desktop
          ];
        };
        "darwin" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
          };
          extraSpecialArgs = {
            username = "pbj";
            stateVersion = "25.11";
          };
          modules = [
            ./home
            ./home/darwin
            ./home/desktop
          ];
        };
      };
    };
}
