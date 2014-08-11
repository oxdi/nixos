let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
  packer = stdenv.mkDerivation {
    name = "packer";
    src = pkgs.fetchurl {
      url = "https://dl.bintray.com/mitchellh/packer/0.6.1_linux_amd64.zip";
      sha256 = "1sjsp0jqmhc9frp6hm1g0zd42dipxwbd9xanhnf504yvnxdaa4ww";
    };
    buildInputs = [
      pkgs.unzip
    ];
    phases = [ "installPhase" ];
    installPhase =
      ''
      ensureDir $out/bin
      unzip $src -d $out/bin
      '';
  };
in 
stdenv.mkDerivation rec {
  name = "shell";
  version = "shell";
  src = ./.;
  buildInputs = [ 
    packer
  ];
  shellHook = ''
    export GOPATH=$(pwd)
    '';
}
