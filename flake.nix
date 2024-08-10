# flake.nix

{
  description = "Themecord NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages = {
      x86_64-linux = let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
      in pkgs.callPackage ./default.nix {};

      aarch64-linux = let
        pkgs = import nixpkgs {
          system = "aarch64-linux";
        };
      in pkgs.callPackage ./default.nix {};
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux;
    defaultPackage.aarch64-linux = self.packages.aarch64-linux;
  };
}
