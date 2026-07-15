{ config, lib, pkgs, inputs, ... }:

{
	users = {
		users = {
			dpz = {
				isNormalUser = true;
				defaultUserShell = pkgs.fish;
				extraGroups = [ "wheel" "adbusers" ];
			};
		};
	};
}

