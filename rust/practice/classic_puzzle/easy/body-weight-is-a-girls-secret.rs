use std::io;

use itertools::Itertools;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut ws: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let w = parse_input!(i, i32);
        ws.push(w);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let first_second: i32 = ws[0];
    let first_third: i32 = ws[1];
    let third_fifth: i32 = ws[ws.len() - 2];
    let fourth_fifth: i32 = ws[ws.len() - 1];
    let sum_all: i32 = ws.iter().sum::<i32>() / 4;

    let third: i32 = sum_all - first_second - fourth_fifth;
    let first: i32 = first_third - third;
    let second: i32 = first_second - first;
    let fifth: i32 = third_fifth - third;
    let fourth: i32 = fourth_fifth - fifth;

    let result: String = [first, second, third, fourth, fifth].iter().join(" ");

    // println!("answer");
    println!("{result}");
}
