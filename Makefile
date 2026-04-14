CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra -Wno-unused-result

# 通常ビルド: make main (main.cppから)
%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<


# サンプルテスト: make test CONTEST=abc454 PROBLEM=a
test:
	cd $(CONTEST)/$(PROBLEM) && oj test

# 提出: make submit CONTEST=abc454 PROBLEM=a
submit:
	cd $(CONTEST)/$(PROBLEM) && acc submit

# コンテスト作成: make new CONTEST=abc454
new:
	acc new $(CONTEST)

# 問題ページをブラウザで開く: make open CONTEST=abc454 PROBLEM=a
open:
	cd $(CONTEST)/$(PROBLEM) && acc open

.PHONY: test submit new open
