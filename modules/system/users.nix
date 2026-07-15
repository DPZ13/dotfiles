{ config, lib, pkgs, inputs, ... }:

{
	users = {
		defaultUserShell = pkgs.fish;
		users = {
			dpz = {
				isNormalUser = true;
				extraGroups = [ "wheel" "adbusers" ];
			};
		};
	};
}

