{ pkgs ? import <nixpkgs> {} }:
pkgs.buildGoModule {
  pname = "ssh-to-pgp";
  version = "1.0.2";

  src = ./.;

  vendorSha256 = "sha256-L0WsKmPvNMty3oA9cIS+4pqD6viZlnKXk8+sV5RJYE4=";

  checkInputs = [ pkgs.gnupg ];
  checkPhase = ''
    HOME=$TMPDIR go test .
  '';

  shellHook = ''
    unset GOFLAGS
  '';

  doCheck = true;

  meta = with pkgs.lib; {
    description = "Convert ssh private keys to PGP";
    homepage = "https://github.com/Mic92/sops-nix";
    license = licenses.mit;
    maintainers = with maintainers; [ mic92 ];
    platforms = platforms.unix;
  };
}
