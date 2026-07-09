{ config, lib, pkgs, inputs, ... }:

{
	boot = {
		loader = {
			efi.canTouchEfiVariables = true;
			grub = {
				enable = true;
				device = "nodev";
				efiSupport = true;
				useOSProber = true;
			};
		};
		kernelPackages = pkgs.linuxPackages_latest;
		kernelParams = [ "pcie.aspm=off" ];
	};
}
