{ config, lib, pkgs, ... }: 

{
	networking = {
		hostName = "nixos";
		domain = "local";
		firewall = {
			enable = true;
		};
	};
}

