{ config, lib, pkgs, inputs, ... }:

{
	environment.shellAliases = {
		"nix.update" = "sudo nixos-rebuild switch --flake /etc/nixos#dpz";
		"flake.update" = "sudo nix flake update --flake /etc/nixos";
		"nix.clean.1d" = "sudo nix-collect-garbage --delete-older-than 1d";
		"nix.clean.7d" = "sudo nix-collect-garbage --delete-older-than 7d";
		"nix.clean.14d" = "sudo nix-collect-garbage --delete-older-than 14d";
		"nix.clean.30d" = "sudo nix-collect-garbage --delete-older-than 30d";
		"nix.clean.all" = "sudo nix-collect-garbage -d";
		"nix.config" = "nvim /etc/nixos/configuration.nix";
		"flake.config" = "nvim /etc/nixos/flake.nix";
    };
}
