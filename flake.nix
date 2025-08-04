{
  description = "Edward Hesketh's professional facing website, written to be as minimal as reasonable.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };
  outputs = { nixpkgs, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      zas = pkgs.buildGoModule {
        pname = "zas";
        version = "025861715cd4cd56ffa39bb961cb3bffe586a716";
        src = pkgs.fetchFromGitHub {
          owner = "darccio";
          repo = "zas";
          rev = "025861715cd4cd56ffa39bb961cb3bffe586a716";
          hash = "sha256-k80xaaWLOyc9Br81C1oH0UvndxX3J0P+D/ONPjxO/4U=";
        };
        vendorHash = "sha256-3SPAc4X03aMckSs4hkVnT8ARTGV7gTudVvoe2OHX7PQ=";
      };
    in
    {
      packages.edwardh-dev = pkgs.stdenv.mkDerivation {
        name = "edwardh-dev";
        src = ./.;
        buildInputs = [ zas pkgs.minify ];
        buildPhase = ''
          zas
          minify -rs .zas/deploy/ -o minified
        '';
        installPhase = ''
          mkdir -p $out
          cp -r minified/. $out
        '';
      };
    };
}
