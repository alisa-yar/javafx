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

# replit.nix = Every new repl is now a Nix repl, which means you can install any package available on Nix.
# The 'deps' array specifies which Nix packages you would like to be available in your environment.
# The .replit file allows you to configure many options for your repl, most basic of which is the run command.