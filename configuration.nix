# https://search.nixos.org/options NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/programs.nix
      ./modules/services.nix
      ./modules/boot.nix
    ];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # host
  networking.hostName = "nixos";

  # network-manager
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = "Europe/Saratov";

  # locales and keymaps in TTY
   i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "ter-u32b";
    packages = with pkgs; [ terminus_font ];
    earlySetup = true;
    useXkbConfig = true;
  };  

  # user (dpz)
  users.users.dpz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # aliases
  environment.shellAliases = {
    "nix.update" = "sudo nixos-rebuild switch --flake /etc/nixos#dpz";
    "flake.update" = "sudo nix flake update --flake /etc/nixos";
    "nix.clean.1d" = "sudo nix-collect-garbage --delete-older-than 1d";
    "nix.clean.7d" = "sudo nix-collect-garbage --delete-older-than 7d";
    "nix.clean.14d" = "sudo nix-collect-garbage --delete-older-than 14d";
    "nix.clean.30d" = "sudo nix-collect-garbage --delete-older-than 30d";
    "nix.clean.all" = "sudo nix-collect-garbage -d";
    "nix.config" = "sudo nvim /etc/nixos/configuration.nix";
    "flake.config" = "sudo nvim /etc/nixos/flake.nix";
    };

  # nvidia settings
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # DO NOT TOUCH STUPID!!!!!!!
  system.stateVersion = "26.05";

}
