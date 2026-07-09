{ config, lib, pkgs, inputs, ... }:

{
	hardware = {
		graphics = {
			enable = true;
		};
		nvidia = {
			modesetting = {
				enable = true;
			};
			open = false;
			package = config.boot.kernelPackages.nvidiaPackages.stable;
		};
	};
}
