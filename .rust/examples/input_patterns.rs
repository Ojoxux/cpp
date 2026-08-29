#![allow(dead_code, unused_imports, unused_variables)]
use proconio::marker::{Chars, Usize1};
use proconio::input;

// N個の値をVecで受け取る基本形
fn pattern_vec() {
    input! {
        n: usize,
        a: [i64; n],
    }
}

// 0-indexedに変換して受け取りたい時 (Usize1)
fn pattern_zero_indexed() {
    input! {
        n: usize,
        a: [Usize1; n],
    }
}

// H×Wの文字グリッド
fn pattern_grid() {
    input! {
        h: usize,
        w: usize,
        grid: [Chars; h],
    }
}

// 辺のリスト (0-indexed変換込み)
fn pattern_edges() {
    input! {
        n: usize,
        m: usize,
        edges: [(Usize1, Usize1); m],
    }
}

// 複数テストケース
fn pattern_multi_case() {
    input! {
        t: usize,
    }
    for _ in 0..t {
        input! {
            n: usize,
        }
    }
}

fn main() {}
