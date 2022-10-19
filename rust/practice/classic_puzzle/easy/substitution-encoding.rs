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
    let rows = parse_input!(input_line, i32);
    let mut row_vector: Vec<String> = Vec::new();
    for i in 0..rows as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        row_vector.push(row);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let message = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut replace_table: HashMap<char, String> = HashMap::new();
    for row_index in 0..row_vector.len() {
        let row: String = row_vector[row_index].split_whitespace().collect();
        for column_index in 0..row.len() {
            let chr: char = row.chars().nth(column_index).unwrap();

            replace_table.insert(chr, format!("{row_index}{column_index}"));
        }
    }

    let mut result: String = "".to_string();
    for chr in message.chars() {
        result += &replace_table[&chr];
    }

    // println!("encode message");
    println!("{result}");
}
