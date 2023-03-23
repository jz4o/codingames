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
    let n = parse_input!(input_line, i32);
    let mut words: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let w = input_line.trim_matches('\n').to_string();
        words.push(w);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let letters = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let point_tuples: [(&str, i32); 7] = [
        ("eaionrtlsu", 1),
        ("dg", 2),
        ("bcmp", 3),
        ("fhvwy", 4),
        ("k", 5),
        ("jx", 8),
        ("qz", 10)
    ];
    let mut points: HashMap<char, i32> = HashMap::new();
    for (chars, point) in point_tuples.iter() {
        for c in chars.chars() {
            points.insert(c, *point);
        }
    }

    let mut result: Result = Result{word: "".to_string(), point: 0};
    for word in words.iter() {
        let mut chars: String = letters.to_string();

        let mut made_flag: bool = true;
        for w in word.chars() {
            if !chars.contains(w) {
                made_flag = false;
                break;
            }

            chars = chars.replacen(w, "", 1);
        }

        if !made_flag {
            continue;
        }

        let point: i32 = word.chars().map(|w| points[&w]).sum();

        if result.point < point {
            result = Result{word: word.to_string(), point: point};
        }
    }

    // println!("invalid word");
    println!("{}", result.word);
}

struct Result {
    word: String,
    point: i32
}
