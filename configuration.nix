#Hier is de Configuratie file voor nixos


{ lib, pkgs, config, modulesPath, ... }:

with lib;
let
  nixos-wsl = import ./nixos-wsl;
in
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"

    #./tmIot.nix # nixos-container with mqtt and influxdb
    #./tmK8s.nix # nixos-container with Kubernetes
    nixos-wsl.nixosModules.wsl
  ];

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };

  services.kubernetes = {
    roles = [ "master" "node" ];
    masterAddress = "localhost";
    easyCerts = true;
    addons.dns.enable = true;

  };
  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "22.05";
}
