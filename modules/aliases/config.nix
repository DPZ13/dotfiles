{ config, lib, pkgs, inputs, ... }:

{
	environment.shellAliases = {
		"nix.config" = "nvim /etc/nixos/configuration.nix";
		"flake.config" = "nvim /etc/nixos/flake.nix";
    };
}

