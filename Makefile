.DEFAULT_GOAL := help

CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra -Wno-unused-result

REPO_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
RUSTC = rustc
RUST_DEPS_DIR = $(REPO_ROOT).rust/target/release/deps
RUSTFLAGS = --edition 2021 -O -L $(RUST_DEPS_DIR) \
	--extern proconio --extern itertools --extern num --extern num_integer --extern rand

# 通常ビルド: make main (main.cppから)
%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

# 通常ビルド: make main (main.rsから)
%: %.rs
	$(RUSTC) $(RUSTFLAGS) -o $@ $<


# サンプルテスト: make test CONTEST=abc454 PROBLEM=a
test:
	cd $(CONTEST)/$(PROBLEM) && oj test -d tests -c ./main

# 提出: make submit CONTEST=abc454 PROBLEM=a [FILE=main.rs]
submit:
	cd $(CONTEST)/$(PROBLEM) && acc submit $(FILE)

# コンテスト作成: make new CONTEST=abc454 [LANG=rust]
new:
	acc new $(CONTEST) $(if $(LANG),--template $(LANG))

# 問題ページをブラウザで開く: make open CONTEST=abc454 PROBLEM=a
open:
	cd $(CONTEST)/$(PROBLEM) && acc open

help:
	@echo "  make main                                    # main.cpp / main.rs をビルド"
	@echo "  make test CONTEST=abc454 PROBLEM=a           # サンプルテスト実行"
	@echo "  make submit CONTEST=abc454 PROBLEM=a [FILE=main.rs]  # 提出"
	@echo "  make new CONTEST=abc454 [LANG=rust]          # コンテスト作成"
	@echo "  make open CONTEST=abc454 PROBLEM=a           # 問題ページを開く"

.PHONY: test submit new open help
