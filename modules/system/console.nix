{ config, lib, pkgs, inputs, ... }:

{
	console = {
		enable = true;
		font = "ter-c32b";
		packages = with pkgs; [ terminus_font ];
		useXkbconfig = true;
		earlySetup = true;
		colors = [
			"000000" # black
			"990000" # red
			"009900" # green
			"999900" # yellow 
			"000099" # blue
			"990099" # magenta
			"009999" # cyan
			"dddddd" # white

			"333333" # bright black
			"ff0000" # bright red
			"00ff00" # bright green
			"ffff00" # bright yellow 
			"0000ff" # bright blue
			"ff00ff" # bright magenta
			"00ffff" # bright cyan
			"ffffff" # bright white
		];

	};
}
