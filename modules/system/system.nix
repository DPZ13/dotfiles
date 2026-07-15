{ config, lib, pkgs, inputs, ... }:

{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	time.timeZone = "Europe/Saratov";
	i18n.defaultLocale = "ru_RU.UTF-8";
	system.stateVersion = "26.05"; # DO NOT TOUCH ! ! !
}
