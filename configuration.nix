# https://search.nixos.org/options NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/programs.nix
    ];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # loader
  boot.loader.grub = {
    enable = true;
    device = "nodev"; 
    efiSupport = true;
    useOSProber = true;
    };
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "pcie.aspm=off"
    "nvidia.NVreg_TemporaryFilePath=/var/tmp"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];

  # experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # host
  networking.hostName = "nixos";

  # network-manager
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = "Europe/Saratov";

  # proxy
  # networking.proxy.default = "socks5h://10.242.47.228:2009";
  # networking.proxy.noProxy = "127.0.0.1,localhost,cache.nixos.org,internal.domain";

  # locales and keymaps in TTY
   i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "ter-u32b";
    packages = with pkgs; [ terminus_font ];
    earlySetup = true;
    # keyMap = [ "us" "ru" ];
    useXkbConfig = true;
  };  

  # keymaps in GUI
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:caps_toggle";

  # sounds
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # touchpad support
  services.libinput.enable = true;

  # user (dpz)
  users.users.dpz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  # SUID wrappers
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # services
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  programs.fish.enable = true;
  services.openssh.enable = false;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # autobackup
  # system.copySystemConfiguration = true;

  # DO NOT TOUCH STUPID!!!!!!!
  system.stateVersion = "26.05";

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
  hardware.graphics.enable32Bit = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # suspend
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
  };
  
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb;
    };

}
