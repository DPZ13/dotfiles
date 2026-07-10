{ config, lib, pkgs, inputs, ... }:


{
  imports =
    [
    	./imports.nix
    ];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
