# javafx
* Linux RPM file - is for Red Hat, Fedora, OpenSuse, etc.;  
* Linux DEB file - is for Debian and its derrivatives, such as Ubuntu, Linux Mint, ZorinOS, etc.  
* Linux APPIMAGE file - works across several Linux distributions and is guaranteed to work freestanding without any installation.  

== JDK options ==

Your default choice should probably be to install <code>jdk11</code>, which is an alias for <code>openjdk11</code>. If you're in a server environment, go for <code>jdk11_headless</code>. Java 11 is the currently-maintained LTS version of OpenJDK as of March 2021.

As you might expect, though, many flavors of Java are available in NixOS.

* OpenJDK, by far the most popular non-Oracle JVM implementation
** <code>openjdk8[_headless]</code> for a legacy Java 8 VM required by some older apps
** <code>openjdk11[_headless]</code>, the currently-supported LTS version of OpenJDK
** <code>openjdk14[_headless]</code>, the current version of OpenJDK
* AdoptOpenJDK, prebuilt binaries for OpenJDK
** <code>adoptopenjdk-bin</code> points to the latest version of AdoptOpenJDK, which is version 11 at the time of writing.
** <code>adoptopenjdk-jre-bin</code> is available if you want to avoid downloading the compiler and only require the runtime environment.
** <code>adoptopenjdk{,-jre}-openj9-bin-{8,11,13}</code> same, but using [https://en.wikipedia.org/wiki/OpenJ9 Eclipse OpenJ9] instead of HotSpot as its JVM.
* JetBrains JDK (<code>jetbrains.jdk</code>), a fork of OpenJDK with modifications made by JetBrains
* Oracle's JDK (<code>oraclejdk</code>), only version 8 is available.

== Using Oracle JDK instead of Open JDK ==
Almost all Java packages in nixpkgs use Open JDK in form of a '''jre''' dependency. If you use Oracle JDK and also want other applications 
to use it, you can simply tweak your <code>.nixpkgs/config.nix</code> so that your desired application uses Oracles JDK or JRE.  

Example with UMLet with JRE 
<syntaxhighlight lang="nix">
{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    umlet = pkgs.umlet.override {
      jre = pkgs.oraclejre8;
    };
  };
}
</syntaxhighlight>

To install the Oracle JRE system-wide, you need to explicitly accept the license in addition to allowing unfree modules:
<syntaxhighlight lang="nix">
# /etc/nixos/configuration.nix
{
  nixpkgs.config.allowUnfree = true;
  programs.java = { enable = true; package = pkgs.oraclejre8; };
}
</syntaxhighlight>

Working with `requireFile` (manual downloading the tarballs and manual adding in to the nix store) might be annoying and nixops-unfriendly, so it can be overridden in overlays

<syntaxhighlight lang="nix">
nixpkgs.overlays = let
  files = {
    "jdk-8u241-linux-linux-arm32-vfp-hflt.tar.gz" = /home/user/blobs/java/jdk-8u241-linux-linux-arm32-vfp-hflt.tar.gz;
    "jdk-8u241-linux-linux-arm64-vfp-hflt.tar.gz" = /home/user/blobs/java/jdk-8u241-linux-linux-arm64-vfp-hflt.tar.gz;
    "jdk-8u241-linux-i586.tar.gz"                 = /home/user/blobs/java/jdk-8u241-linux-i586.tar.gz;
    "jdk-8u241-linux-x64.tar.gz"                  = /home/user/blobs/java/jdk-8u241-linux-x64.tar.gz;
  };
in [
  (self: super: {
    requireFile = args @ {name, url, sha1 ? null, sha256 ? null}:
      if files?${name} then
        self.stdenvNoCC.mkDerivation {
          inherit name;
          outputHashMode = "flat";
          outputHashAlgo = if sha256 != null then "sha256" else "sha1";
          outputHash     = if sha256 != null then  sha256  else  sha1 ;
          buildCommand   = "cp ${files.${name}} $out";
        }
      else
        super.requireFile args;
  })
];
</syntaxhighlight>

== Better font rendering==

By default java does not enable antialiasing for font rendering. By exporting environment variables, this can be fixed:

<syntaxhighlight lang="console">
$ export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
</syntaxhighlight>

More options can be found in the [https://wiki.archlinux.org/index.php/Java_Runtime_Environment_fonts archlinux wiki]

== Overriding java jks Certificate Store ==
Overriding the java certificate store may be required for adding your own Root certificates in case your company uses an internal PKI or the company utilizes an intercepting proxy.
=== jdk8 ===
Overriding the jdk8 certificate store is possible by overriding the '''cacert''' parameter of the package:

<syntaxHighlight lang=nix>
{ pkgs, ... }:
let 
  myjdk = pkgs.jdk8.override {
    cacert = pkgs.runCommand "mycacert" {} ''
      mkdir -p $out/etc/ssl/certs
      cat ${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt \
        ${./my-company-root-certificate.crt} > $out/etc/ssl/certs/ca-bundle.crt
    '';
  };
in {
  programs.java = {
    enable = true;
    package = myjdk
  };
}
</syntaxHighlight>
the java package build will use the '''ca-bundle''' to run keytool and transform it into '''jks''' format.

you could also use <syntaxHighlight lang=nix>
{
  nixpkgs.overlays = [(self: super: {jdk = super.jdk8.override { };} )];
}
</syntaxHighlight> to override the default jdk so all packages use the patched java version.

=== jdk11 ===
JDK11 does not provide the cacert overridable and therefore it is not possible to use the same technique to override the truststore.

== Building and Packaging ==

see the [https://ryantm.github.io/nixpkgs/languages-frameworks/java/ Java section in the Nixpkgs manual]

=== Maven ===

[https://maven.apache.org/run.html Maven] is a build tool for Java. The typical build command is

<pre>mvn verify</pre>

[https://github.com/fzakaria/mvn2nix mvn2nix] and [https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/build-maven.nix buildMaven] can be used to build Maven projects with Nix

See also: [https://fzakaria.com/2020/07/20/packaging-a-maven-application-with-nix.html Packaging a Maven application with Nix]

=== Ant ===

[https://ant.apache.org/manual/running.html Ant] is a build tool for Java. To build the <code>compile</code> target, run

<pre>ant compile</pre>

To list available build targets, run