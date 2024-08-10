# flake.nix

# flake.nix
{
  description = "Themecord flake.nix";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.default = (import ./default.nix { inherit pkgs; });
  };
}
