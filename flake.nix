{
  description = "atcoder-env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # C++ コンパイラ
            gcc
            gnumake

            # デバッグツール
            gdb

            # online-judge-tools + selenium
            (python3.withPackages (ps: [
              ps.online-judge-tools
            ]))

            # atcoder-cli (Node.js経由)
            nodejs
          ];

          shellHook = ''
            export NPM_CONFIG_PREFIX="$HOME/.npm-global"
            export PATH="$HOME/.npm-global/bin:$PATH"
            mkdir -p "$NPM_CONFIG_PREFIX"

            echo "atcoder-env (g++ $(g++ --version | head -1 | awk '{print $NF}'))"

            # atcoder-cliをインストール（初回だけ）
            if ! command -v acc >/dev/null 2>&1; then
              echo ""
              echo "atcoder-cli をインストール中..."
              npm install -g atcoder-cli
            fi
          '';
        };
      });
}
