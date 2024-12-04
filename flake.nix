{
  inputs = {
    utils.url = "github:numtide/flake-utils/v1.0.0";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem(
      system:
        let 
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          packages = {
            default = pkgs.buildGoModule rec {
              pname = "pcmd";
              version = "1.0.0";

              src = pkgs.fetchFromGitHub {
                owner = "fieu";
                repo = pname;
                rev = "v${version}";
                hash = "sha256-nRl1yjAFyDzAj3Nsla70CzJtxethYaxjezUXlowfPSQ=";
              };

              vendorHash = "sha256-1TyFfRL6HTOa+M4CEcHeiReRcPlPNKMneq2AVXS0kX0=";
            };
          };
        }
    );
}
