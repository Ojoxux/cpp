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

            # Rust
            rustc
            cargo
            rustfmt
            clippy

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

            echo "atcoder-env (g++ $(g++ --version | head -1 | awk '{print $NF}'), rustc $(rustc --version | awk '{print $2}'))"

            # atcoder-cliをインストール（初回だけ）
            if ! command -v acc >/dev/null 2>&1; then
              echo ""
              echo "atcoder-cli をインストール中..."
              npm install -g atcoder-cli
            fi

            # Rust用の依存クレート(proconioなど)を初回だけビルド
            if [ ! -d "$PWD/.rust/target/release/deps" ]; then
              echo ""
              echo "Rust依存クレートをビルド中（初回のみ）..."
              (cd "$PWD/.rust" && cargo build --release)
            fi

            # atcoder-cliにrustテンプレートを登録（acc new --template rust で使えるようにする）
            if command -v acc >/dev/null 2>&1; then
              ACC_CONFIG_DIR="$(acc config-dir)"
              mkdir -p "$ACC_CONFIG_DIR/rust"
              cp "$PWD/template.rs" "$ACC_CONFIG_DIR/rust/main.rs"
              cat > "$ACC_CONFIG_DIR/rust/template.json" <<'JSON'
{
  "task": {
    "program": ["main.rs"],
    "submit": "main.rs"
  }
}
JSON
            fi
          '';
        };
      });
}
