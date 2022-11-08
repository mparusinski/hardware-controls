{
  description = "Hardware controls in XMonad like environment (e.g. backlight control)";
  
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.05;

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in
      pkgs.writeShellScriptBin "dpower" ''
        CHOICE=$(printf '%s\n' "poweroff" "reboot" | ${pkgs.dmenu}/bin/dmenu -p ?)
        echo systemctl "$CHOICE"
      '';
  };
}
