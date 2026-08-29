#![allow(unused_imports, unused_macros, dead_code)]
use proconio::{input, marker::Chars, marker::Usize1};
use std::collections::*;

const INF: i64 = 1 << 60;

macro_rules! chmin {
    ($a:expr, $b:expr) => {
        if $a > $b {
            $a = $b;
            true
        } else {
            false
        }
    };
}
macro_rules! chmax {
    ($a:expr, $b:expr) => {
        if $a < $b {
            $a = $b;
            true
        } else {
            false
        }
    };
}
macro_rules! yes_no {
    ($b:expr) => {
        println!("{}", if $b { "Yes" } else { "No" });
    };
}

fn main() {
    input! {
    }
}
