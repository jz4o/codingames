use std::io;

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
    let n1 = parse_input!(inputs[0], i32);
    let n2 = parse_input!(inputs[1], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let s1 = input_line.trim().to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let s2 = input_line.trim().to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let t = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let s1_move_value_size: usize = *[t as usize, s1.len()].iter().min().unwrap();
    let s1_move_value_part: Vec<String> = s1[..s1_move_value_size].chars().map(|c| c.to_string()).rev().collect();
    let s1_move_fill_part: Vec<String> = vec!["".to_string();t as usize - s1_move_value_size];
    let s1_move_part: Vec<String> = [s1_move_fill_part, s1_move_value_part].concat();
    let s1_not_move_part: Vec<String> = if s1.len() <= t as usize {
        Vec::new()
    } else {
        s1[t as usize..].chars().map(|c| c.to_string()).rev().collect()
    };

    let s2_move_value_size: usize = *[t as usize, s2.len()].iter().min().unwrap();
    let s2_move_value_part: Vec<String> = s2[..s2_move_value_size].chars().map(|c| c.to_string()).collect();
    let s2_move_fill_part: Vec<String> = vec!["".to_string();t as usize - s2_move_value_size];
    let s2_move_part: Vec<String> = [s2_move_value_part, s2_move_fill_part].concat();
    let s2_not_move_part: Vec<String> = if s2.len() <= t as usize {
        Vec::new()
    } else {
        s2[t as usize..].chars().map(|c| c.to_string()).collect()
    };

    let s_moved_part: Vec<String> = s2_move_part
        .iter()
        .zip(s1_move_part.iter())
        .flat_map(|(s2_part, s1_part)| [s2_part.to_string(), s1_part.to_string()])
        .collect();

    let result: String = [s1_not_move_part, s_moved_part, s2_not_move_part].concat().join("");

    // println!("answer");
    println!("{result}");
}
