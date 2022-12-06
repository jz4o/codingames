use std::io;

use regex::Regex;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut pixels: Vec<i32> = Vec::new();
    for i in 0..h as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        for j in inputs.split_whitespace() {
            let pixel = parse_input!(j, i32);

            pixels.push(pixel);
        }
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let bits: String = pixels.iter().map(|pixel| (pixel % 2).to_string()).collect::<Vec<String>>().join("");
    let result: String = Regex::new(".{8}")
        .unwrap()
        .find_iter(&bits)
        .map(|bit| (u8::from_str_radix(bit.as_str(), 2).unwrap() as char).to_string())
        .collect::<Vec<String>>()
        .join("");

    // println!("answer");
    println!("{result}");
}
