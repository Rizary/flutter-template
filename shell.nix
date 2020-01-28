let
  pkgs = import ./nix/nixpkgs.nix;
  android-sdk =pkgs.androidsdk_9_0;
  
  android-emulator = pkgs.androidenv.emulateApp {
    name = "emulate-Flutter";
    platformVersion = "28";
    abiVersion = "x86_64";
    systemImageType = "google_apis_playstore";
  };

  
in
pkgs.mkShell {
  buildInputs = [
    pkgs.flutter
    android-sdk
    
    android-emulator
  ];
  ANDROID_HOME = "${android-sdk}/libexec/android-sdk";
}
