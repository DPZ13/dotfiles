{ config, lib, pkgs, inputs, ... }:

{
	environment.shellAliases = {
		"nix.clean.1d" = "sudo nix-collect-garbage --delete-older-than 1d";
		"nix.clean.3d" = "sudo nix-collect-garbage --delete-older-than 3d";
		"nix.clean.7d" = "sudo nix-collect-garbage --delete-older-than 7d";
		"nix.clean.14d" = "sudo nix-collect-garbage --delete-older-than 14d";
		"nix.clean.30d" = "sudo nix-collect-garbage --delete-older-than 30d";
		"nix.clean.all" = "sudo nix-collect-garbage -d";
    };
}
