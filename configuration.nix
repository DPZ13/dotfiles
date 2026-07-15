{ config, lib, pkgs, inputs, ... }:


{
  imports =
    [
      ./hosts/LOQ_15ARP9/hardware-configuration.nix

      ./modules/aliases/clean.nix
      ./modules/aliases/config.nix
      ./modules/aliases/update.nix

      ./modules/boot/kernel.nix
      ./modules/boot/loader.nix

      ./modules/hardware/nvidia.nix

      ./modules/network/default.nix
      ./modules/network/networkmanager.nix

      ./modules/packages/packages.nix
      ./modules/packages/programs.nix
      ./modules/packages/services.nix

      ./modules/system/console.nix
      ./modules/system/system.nix
      ./modules/system/users.nix
    ];
}
