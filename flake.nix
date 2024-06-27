{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/9957cd48326fe8dbd52fdc50dd2502307f188b0d"; # Hugo 0.119.0
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            hugo
          ];
        };
    };
}
