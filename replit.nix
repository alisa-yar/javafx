# https://docs.replit.com/programming-ide/configuring-repl#advanced
# replit.nix = Every new repl is now a Nix repl, which means you can install any package available on Nix.
# https://search.nixos.org/packages
# The 'deps' array specifies which Nix packages you would like to be available in your environment.

# pkgs.graalvm17-ce = High-performance runtime with new compiler optimizations to accelerate Java application performance 
# and lower infrastructure costs on premises and in the cloud
# pkgs.maven = Apache Maven is a software project management and comprehension tool. 
# Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.
# pkgs.jdt-language-server = Java language server. 
# The Eclipse JDT Language Server is a Java language specific implementation of the Language Server Protocol 
# and can be used with any editor that supports the protocol, to offer good support for the Java Language
# https://github.com/eclipse/eclipse.jdt.ls
# pkgs.replitPackages.java-debug = 
# pkgs.xorg.libX11 = X11 client-side library
# The original C-language X11 API is libX11, often referred to as "Xlib". 
# It was designed to look like a traditional library API, hiding the fact that calls result in protocol requests to a server. 
# Calls that don't require a response from the X server are queued in a buffer to be sent as a batch of requests to the server. 
# Those that require a response flush all the buffered requests and then block until the response is received.



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

