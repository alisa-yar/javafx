## JDK options 

Your default choice should probably be to install `jdk11`, which is an alias for `openjdk11`.  
If you're in a server environment, go for `jdk11_headless`.  
Java 11 is the currently-maintained LTS version of OpenJDK as of March 2021.  

As you might expect, though, many flavors of Java are available in NixOS.  

**OpenJDK, by far the most popular non-Oracle JVM implementation**  
* `openjdk8[_headless]` for a legacy Java 8 VM required by some older apps  
* `openjdk11[_headless]`, the currently-supported LTS version of OpenJDK  
* `openjdk14[_headless]`, the current version of OpenJDK  

**AdoptOpenJDK, prebuilt binaries for OpenJDK**  
* `adoptopenjdk-bin` points to the latest version of AdoptOpenJDK, which is version 11 at the time of writing.  
* `adoptopenjdk-jre-bin` is available if you want to avoid downloading the compiler and only require the runtime environment.  
* `adoptopenjdk{,-jre}-openj9-bin-{8,11,13}` same, but using [Eclipse OpenJ9](https://en.wikipedia.org/wiki/OpenJ9) instead of HotSpot as its JVM.  

**JetBrains JDK `jetbrains.jdk` a fork of OpenJDK with modifications made by JetBrains**

**Oracle's JDK `oraclejdk` only version 8 is available**

## Using Oracle JDK instead of Open JDK  
Almost all Java packages in nixpkgs use Open JDK in form of a `jre` dependency. If you use Oracle JDK and also want other applications to use it, 
you can simply tweak your `.nixpkgs/config.nix` so that your desired application uses Oracles JDK or JRE.

**Example with UMLet with JRE:**  
```
{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    umlet = pkgs.umlet.override {
      jre = pkgs.oraclejre8;
    };
  };
}
```

## How to install the Oracle JRE system-wide  
You need to explicitly accept the license in addition to allowing unfree modules:  
```
# /etc/nixos/configuration.nix
{
  nixpkgs.config.allowUnfree = true;
  programs.java = { enable = true; package = pkgs.oraclejre8; };
}
```

Working with `requireFile` (manual downloading the tarballs and manual adding in to the nix store)  
might be annoying and nixops-unfriendly, so it can be overridden in overlays.  

```
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
```

## Better font rendering

By default java does not enable antialiasing for font rendering.  
By exporting environment variables, this can be fixed:  
```
$ export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
```
More options can be found in the [archlinux wiki](https://wiki.archlinux.org/index.php/Java_Runtime_Environment_fonts)

## Overriding java jks Certificate Store 
Overriding the java certificate store may be required for adding your own Root certificates   
in case your company uses an internal PKI or the company utilizes an intercepting proxy.  

### jdk8
Overriding the jdk8 certificate store is possible by overriding the `cacert` parameter of the package:  
``` 
{ pkgs, ... }:
let 
  myjdk = pkgs.jdk8.override {
    cacert = pkgs.runCommand "mycacert" {} 
      mkdir -p $out/etc/ssl/certs
      cat ${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt \
        ${./my-company-root-certificate.crt} > $out/etc/ssl/certs/ca-bundle.crt
    ;
  };
in {
  programs.java = {
    enable = true;
    package = myjdk
  };
}
```

the java package build will use the `ca-bundle` to run keytool and transform it into `jks` format.
You could also use      
```
{
  nixpkgs.overlays = [(self: super: {jdk = super.jdk8.override { };} )];
}
```
to override the default jdk so all packages use the patched java version.

### jdk11
JDK11 does not provide the cacert overridable and therefore it is not possible to use the same technique to override the truststore.

## Building and Packaging

see the [Java section in the Nixpkgs manual](https://ryantm.github.io/nixpkgs/languages-frameworks/java/)

### Maven

[Maven](https://maven.apache.org/run.html) is a build tool for Java. The typical build command is

```
mvn verify
```

[mvn2nix](https://github.com/fzakaria/mvn2nix) and [buildMaven](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/build-maven.nix) can be used to build Maven projects with Nix

See also: [Packaging a Maven application with Nix](https://fzakaria.com/2020/07/20/packaging-a-maven-application-with-nix.html)

### Ant
[Ant](https://ant.apache.org/manual/running.html) is a build tool for Java.   
To build the `compile` target, run  
```
ant compile
```

To list available build targets, run  

```
ant -p
```

### Ivy

[Ivy](https://ant.apache.org/ivy/) is a package manager for Ant, not to be confused with [ivy](https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/interpreters/ivy/default.nix) - an APL-like calculator

To fetch ivy sources manually, see for example [pkgs/applications/editors/jedit](https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/jedit)

To fetch ivy sources in a fixed-output-derivation, see for example [yacy.nix](https://github.com/milahu/nur-packages/blob/master/pkgs/yacy/yacy.nix)

