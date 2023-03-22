# https://docs.replit.com/programming-ide/configuring-repl#advanced

# replit.nix = Every new repl is now a Nix repl, which means you can install any package available on Nix.
# https://search.nixos.org/packages

# The 'deps' array specifies which Nix packages you would like to be available in your environment.

# pkgs.graalvm17-ce = High-performance runtime with new compiler optimizations to accelerate Java application performance 
# and lower infrastructure costs on premises and in the cloud

########## MAVEN (pkgs.maven) ########## 
# Apache Maven is a software project management and comprehension tool. 
# Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.
# Build tool is essential for the process of building. It is needed for the following processes:
# • Generating source code
# • Generating documentation from the source code
# • Compiling of source code
# • Packaging of the complied codes into JAR files
# • Installing the packaged code in local repository, server or central repository
# Project Object Model (POM) = an XML file that has all the information regarding project and configuration details.
# When we tend to execute a task, Maven searches for the POM in the current directory


# pkgs.jdt-language-server = Java language server. 
# The Eclipse JDT Language Server is a Java language specific implementation of the Language Server Protocol 
# and can be used with any editor that supports the protocol, to offer good support for the Java Language
# https://github.com/eclipse/eclipse.jdt.ls

# pkgs.replitPackages.java-debug = 

# pkgs.xorg.libX11 = X11 client-side library
# Most programming languages make it awkward for X applications to spit raw X protocol down the network and take apart the protocol coming back. 
# Thus, X toolkits and applications are a lot easier to write if some library handles these jobs for them, providing an API that fits with the programming language and environment for connecting to the X server.
# At the bottom level of the X client library stack are Xlib and XCB, two helper libraries (really sets of libraries) that provide API for talking to the X server. 
# Xlib and XCB have different design goals, and were developed in different periods in the evolution of the X Window System.
# The original C-language X11 API is libX11, often referred to as "Xlib". 
# It was designed to look like a traditional library API, hiding the fact that calls result in protocol requests to a server. 
# Calls that don't require a response from the X server are queued in a buffer to be sent as a batch of requests to the server. 
# Those that require a response flush all the buffered requests and then block until the response is received.

# pkgs.scenebuilder = A visual, drag'n'drop, layout tool for designing JavaFX application user interfaces.

{ pkgs }: {
    deps = [
        pkgs.unzip
        pkgs.graalvm17-ce
        pkgs.maven
        pkgs.replitPackages.jdt-language-server
        pkgs.replitPackages.java-debug
        pkgs.xorg.libX11
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

# pkgs.lib.makeLibraryPath =
# pkgs.xorg.libX11 = 
# pkgs.xorg.libXxf86vm = X.Org Xxf86vm library
# pkgs.libGL = 
# pkgs.xorg.libXtst = X.Org Xlib-based client API for the XTEST & RECORD extensions library




