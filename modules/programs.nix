{ config, lib, pkgs, inputs, ... };

{
	programs = {
		niri = {
			enable = true;
			package = inputs.niripkg.packages.${pkgs.system}.default;
			useNautilus = false;
		};

		foot = {
			enable = true;
		};

		neovim = {
			enable = true;
			defaultEditor = true;
		};

		fish = {
			enable = true;
			useBabelfish = true;
		};

		nix-index = {
			enable = true;
			enableFishIntegration = true;
		};

		command-not-found = {
			enable = false;
		};

		yazi = {
			enable = true;
		};

		waybar = {
			enable = true;
			systemd.target = "graphical-session.target";
		};
	};

	environment.systemPackages = with pkgs; [
		brave
		wev
		fastfetch
		telegram-desktop
		fuzzel
		btop
		git
	];
}
