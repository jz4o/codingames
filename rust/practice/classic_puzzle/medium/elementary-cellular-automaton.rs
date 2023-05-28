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
    let r = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let start_pattern = input_line.trim().to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const RULE_LENGTH: usize = 8;

    let reversed_binary_digits: Vec<i32> = zero_fill(format!("{:b}", r), RULE_LENGTH)
        .chars()
        .map(|c| c.to_string().parse::<i32>().unwrap())
        .rev()
        .collect();

    let mut rule: HashMap<String, i32> = HashMap::new();
    for i in 0..RULE_LENGTH {
        let key: String = zero_fill(format!("{:b}", i), 3);
        let value: i32 = reversed_binary_digits[i];

        rule.insert(key, value);
    }

    let mut results: Vec<String> = Vec::new();
    let mut temp: String = start_pattern.replace(".", "0").replace("@", "1");
    for _ in 0..n {
        let result: String = temp.replace("0", ".").replace("1", "@");
        results.push(result);

        let temp_length: usize = temp.len();
        let new_temp: String = temp[temp.len() - 1..].to_string() + &temp.to_string() + &temp[..1].to_string();

        temp = "".to_string();
        for i in 0..temp_length {
            temp += &rule[&new_temp[i..(i + 3)]].to_string();
        }
    }

    // println!(".....@.@.....");
    for result in results {
        println!("{result}");
    }
}

fn zero_fill(text: String, length: usize) -> String {
    return if text.len() < length {
        "0".repeat(length - text.len()) + &text.to_string()
    } else {
        text.to_string()
    };
}
