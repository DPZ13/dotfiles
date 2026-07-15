{ config, lib, pkgs, inputs, ... }:

{
	environment.systemPackages = with pkgs; [
		brave
		wev
		fastfetch
		telegram-desktop
		fuzzel
		btop
		git
		tree
	];
}

