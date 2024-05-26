{
  description = "A sublime colorscheme for Neovim, enveloping your coding environment in the tranquil shades of twilight, enhancing focus and fostering creativity.";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        alejandra
        nil
        stylua
        nodejs_22
      ];
    };
    formatter.${system} = pkgs.alejandra;
  };
}
