use std::io;

use std::collections::HashMap;

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
    let l = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut input_lines: Vec<(String, i32)> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let pattern = inputs[0].trim().to_string();
        let tempo = parse_input!(inputs[1], i32);

        input_lines.push((pattern, tempo));
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut pattern_to_int: HashMap<String, i32> = HashMap::new();
    for (pattern, _) in input_lines.iter() {
        let int: i32 = i32::from_str_radix(&pattern.replace("X", "1"), 2).unwrap();

        pattern_to_int.insert(pattern.to_string(), int);
    }

    let mut results: Vec<String> = Vec::new();
    for i in 1..l + 1 {
        let mut result_number: i32 = 0;
        for (pattern, tempo) in input_lines.iter() {
            if i % tempo == 0 {
                result_number |= pattern_to_int[pattern];
            }
        }

        let result: String = format!("{:>04b}", result_number).replace("1", "X");

        results.insert(0, result);
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
