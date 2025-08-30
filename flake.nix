{
	description = "Minimal zig environment";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils }:
		flake-utils.lib.eachDefaultSystem (system: let
			pkgs = import nixpkgs { inherit system; };
		in {
			devShells.default = pkgs.mkShell {
				name = "cwr-sose25-shell";

				# Things to be available in the shell
				buildInputs = [
					pkgs.zig
					pkgs.zls
				];
			};
		}
		);

}

