# AtCoderやるための環境

## セットアップ

```bash
direnv allow
acc login
oj login https://atcoder.jp
acc config default-template cpp
acc config default-task-dirname-format {tasklabel}
```

## コンテストやる時の流れ

```bash
make new CONTEST=abc454     # コンテスト作成
# コードを書く
make main                   # コンパイル (main.cpp → main)
make test CONTEST=abc454 PROBLEM=a    # サンプルテスト
make submit CONTEST=abc454 PROBLEM=a  # 提出
```

## よく使うやつ

| コマンド      | 説明                           |
| ------------- | ------------------------------ |
| `acc session` | ログイン確認                   |
| `oj test`     | テスト（問題ディレクトリ内で） |
| `acc submit`  | 提出（問題ディレクトリ内で）   |
