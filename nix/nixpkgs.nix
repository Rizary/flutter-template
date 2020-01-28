let
  sources = import ./sources.nix;

  nixpkgs = import sources.nixpkgs {
    config = { android_sdk.accept_license = true; };
  };

  pkgs = import sources.nixpkgs-flutter {
    config = {
      adroid_sdk.accept_license = true;
    };
    overlays = [
    ];
  };
in
nixpkgs // pkgs
