{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
    	./modules/imports.nix
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

  # DO NOT TOUCH STUPID!!!!!!!
  system.stateVersion = "26.05";

}
