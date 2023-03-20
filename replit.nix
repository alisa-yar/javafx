# replit.nix = Every new repl is now a Nix repl, which means you can install any package available on Nix.
# https://search.nixos.org/packages
# The 'deps' array specifies which Nix packages you would like to be available in your environment.

{ pkgs }: {
    deps = [
        pkgs.unzip
        pkgs.graalvm17-ce
        pkgs.maven
        pkgs.replitPackages.jdt-language-server
        pkgs.replitPackages.java-debug
        pkgs.xorg.libX11
				# pkgs.scenebuilder
    ];
    env = {
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            pkgs.xorg.libX11
            pkgs.xorg.libXxf86vm
            pkgs.libGL
            pkgs.xorg.libXtst
        ];
    };
}

