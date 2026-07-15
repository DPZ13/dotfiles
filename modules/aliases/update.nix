{ config, lib, pkgs, inputs, ... }:

{
	environment.shellAliases = {
		"nix.update" = "sudo nixos-rebuild switch --flake /etc/nixos#dpz";
		"flake.update" = "sudo nix flake update --flake /etc/nixos";
	};
}

