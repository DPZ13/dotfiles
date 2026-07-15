{ config, lib, pkgs, inputs, ... }:

{
	users = {
		users = {
			defaultUserShell = pkgs.fish;
			dpz = {
				isNormalUser = true;
				extraGroups = [ "wheel" "adbusers" ];
			};
		};
	};
}

