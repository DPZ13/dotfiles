{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hosts/lenovo/hardware-configuration.nix
      ./modules/programs.nix
      ./modules/services.nix
      ./modules/boot.nix
      ./modules/hardware.nix
      ./modules/aliases.nix
      ./modules/network/network.nix
    ];
}
