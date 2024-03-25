{
  description = "An i3-like tiling window manager for macOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.aarch64-darwin.default =
      with import nixpkgs
        {
          system = "aarch64-darwin";
        };
      stdenv.mkDerivation {
        name = "aerospace";
        version = "0.9.0-Beta";
        src = fetchzip {
          url = "https://github.com/nikitabobko/AeroSpace/releases/download/v0.9.0-Beta/AeroSpace-v0.9.0-Beta.zip";
          hash = "sha256-UVNMjKPMUDuSKPMtLLBb3Lqu5Xocp9X99i+tPjktdbA=";
        };

        unpackPhase = ''
          ls -lah $src/
          cp -r $src/ $out/
        '';
      };

  };
}
