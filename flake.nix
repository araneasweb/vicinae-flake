{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    packages = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.callPackage ./default.nix {};
        vicinae = self.packages.${system}.default;
      }
    );
  };
}
