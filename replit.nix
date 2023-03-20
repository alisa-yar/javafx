{ pkgs }: {
    deps = [
        pkgs.graalvm17-ce 
        pkgs.maven
        pkgs.replitPackages.jdt-language-server
        pkgs.replitPackages.java-debug
    ];
}
# replit.nix = Every new repl is now a Nix repl, which means you can install any package available on Nix