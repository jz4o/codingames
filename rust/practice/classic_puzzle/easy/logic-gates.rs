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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let m = parse_input!(input_line, i32);
    let mut input_signals: HashMap<String, String> = HashMap::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let input_name = inputs[0].trim().to_string();
        let input_signal = inputs[1].trim().to_string();
        input_signals.insert(input_name, input_signal);
    }
    let mut output_lines: Vec<Vec<String>> = Vec::new();
    for i in 0..m as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let output_name = inputs[0].trim().to_string();
        let _type = inputs[1].trim().to_string();
        let input_name_1 = inputs[2].trim().to_string();
        let input_name_2 = inputs[3].trim().to_string();
        output_lines.push(vec![output_name, _type, input_name_1, input_name_2]);
    }
    for i in 0..m as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let output_line: Vec<String> = output_lines.get(i).unwrap().to_vec();
        let output_name: String = output_line[0].to_string();
        let _type: String = output_line[1].to_string();
        let input_name_1: String = output_line[2].to_string();
        let input_name_2: String = output_line[3].to_string();

        let input_signal_1: String = input_signals[&input_name_1].to_string();
        let input_signal_2: String = input_signals[&input_name_2].to_string();

        let mut signal_chars: Vec<Vec<String>> = Vec::new();
        for j in 0..input_signal_1.len() {
            let input_signal_1_str: String = input_signal_1.chars().nth(j).unwrap().to_string();
            let input_signal_2_str: String = input_signal_2.chars().nth(j).unwrap().to_string();

            signal_chars.push(vec![input_signal_1_str, input_signal_2_str]);
        }

        let mut output: String = "".to_string();
        if _type == "AND" {
            for chars in signal_chars {
                output += if chars.iter().all(|c| c == "-") {"-"} else {"_"}
            }
        } else if _type == "OR" {
            for chars in signal_chars {
                output += if chars.iter().any(|c| c == "-") {"-"} else {"_"}
            }
        } else if _type == "XOR" {
            for chars in signal_chars {
                output += if chars[0] != chars[1] {"-"} else {"_"}
            }
        } else if _type == "NAND" {
            for chars in signal_chars {
                output += if chars.iter().all(|c| c == "-") {"_"} else {"-"}
            }
        } else if _type == "NOR" {
            for chars in signal_chars {
                output += if chars.iter().any(|c| c == "-") {"_"} else {"-"}
            }
        } else if _type == "NXOR" {
            for chars in signal_chars {
                output += if chars[0] != chars[1] {"_"} else {"-"}
            }
        }

        let result: String = format!("{output_name} {output}");

        // println!("output name and signal");
        println!("{result}");
    }
}
