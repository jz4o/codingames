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
    let sequence = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut sequence_chars: Vec<char> = sequence.chars().collect();

    let mut depths: HashMap<char, Vec<f32>> = HashMap::new();
    let mut depth: f32 = 0f32;
    while sequence_chars.len() > 0 {
        let mut chr: char = sequence_chars.remove(0);

        if chr == '-' {
            chr = sequence_chars.remove(0);

            if !depths.contains_key(&chr) {
                depths.insert(chr, Vec::new());
            }
            depths.get_mut(&chr).unwrap().push(depth);

            depth -= 1f32;
        } else {
            depth += 1f32;
        }
    }

    let mut max_key: Option<&char> = None;
    let mut max_value: Option<f32> = None;
    for key in depths.keys() {
        let value = depths[key].iter().map(|&v| 1f32 / v).sum::<f32>();
        if max_value.unwrap_or(0f32) < value {
            max_value = Some(value);
            max_key = Some(key);
        }
    }

    let result: &char = max_key.unwrap();

    // println!("answer");
    println!("{result}");
}
