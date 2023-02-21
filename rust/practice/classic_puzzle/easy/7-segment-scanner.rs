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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let line_1 = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let line_2 = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let line_3 = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const NUM_PARTS_LIST: [&str;10] = [
        " ||_ _ ||",
        "       ||",
        "  |___ | ",
        "   ___ ||",
        " |  _  ||",
        " | ___  |",
        " ||___  |",
        "   _   ||",
        " ||___ ||",
        " | ___ ||"
    ];

    let char_grid: Vec<Vec<char>> = line_1
        .chars()
        .zip(line_2.chars())
        .zip(line_3.chars())
        .map(|((a, b), c)| vec![a, b, c])
        .collect();

    let mut results: Vec<usize> = Vec::new();
    for index in (0..char_grid.len()).step_by(3) {
        let target_num_parts: String = char_grid[index..index + 3].iter().flatten().join("");
        let num: usize = NUM_PARTS_LIST.iter().position(|num_parts| num_parts.to_string() == target_num_parts).unwrap();

        results.push(num);
    }

    let result: String = results.iter().map(|result| result.to_string()).join("");

    // println!("number");
    println!("{result}");
}
