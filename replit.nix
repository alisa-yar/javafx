{ pkgs }: {
    deps = [
        pkgs.graalvm17-ce 
        pkgs.maven
        pkgs.replitPackages.jdt-language-server
        pkgs.replitPackages.java-debug
    ];
}
# replit.nix = Every new repl is now a Nix repl, which means you can install any package available on Nix.
# The 'deps' array specifies which Nix packages you would like to be available in your environment.
# The .replit file allows you to configure many options for your repl, most basic of which is the run command.