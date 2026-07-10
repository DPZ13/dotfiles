{ config, lib, pkgs, ... }: 

{
	networking = {
		hostname = "nixos";
		networkmanager = {
			enable = true;
		};
	};
}
