{ config, lib, pkgs, inputs, ... }:

{
	services = {
		displayManager = {
			sddm = {
				enable = true;
				wayland.enable = true;
			};
			defaultSession = "niri";
		};
		xserver = {
			videoDrivers = [ "nvidia" ];
			xkb = {
				layout = "us,ru";
				options = "grp:caps_toggle";
			};
		};
		openssh = {
			enable = false;
		};
		libinput = {
			enable = true;
		};
		pipewire = {
			enable = true;
			pulse.enable = true;
		};
	};
}
