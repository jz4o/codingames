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
    let n = parse_input!(inputs[0], i32);
    let m = parse_input!(inputs[1], i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim().to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut replaced_string: String = lines.join("");
    let mut replace_vec: Vec<String> = Vec::new();

    let mut replace_char: char = 'Z';

    loop {
        let char_vec: Vec<char> = replaced_string.chars().collect();
        let char_groups: Vec<String> = char_vec[..char_vec.len() - 1]
            .iter()
            .zip(char_vec[1..].iter())
            .map(|(l, r)| format!("{l}{r}"))
            .collect();
        let group_sizes: Vec<(String, usize)> = char_groups
            .iter()
            .map(|char_group|
                (char_group.to_string(), Regex::new(char_group).unwrap().find_iter(&replaced_string).count())
            )
            .collect();

        let max_group_size: usize = *group_sizes.iter().map(|(_, group_size)| group_size).max().unwrap();
        let mut target_char: Option<String> = None;
        let mut target_size: Option<usize> = None;
        for (char_group, group_size) in group_sizes.iter() {
            if group_size == &max_group_size {
                target_char = Some(char_group.to_string());
                target_size = Some(*group_size);
                break;
            }
        }

        if target_size.is_some() && target_size.unwrap() < 2 {
            break;
        }

        replaced_string = replaced_string.replace(&target_char.as_ref().unwrap().to_string(), &replace_char.to_string());
        replace_vec.push(format!("{} = {}", replace_char, target_char.as_ref().unwrap().to_string()));

        replace_char = char::from_u32(replace_char as u32 - 1).unwrap();
    }

    let results: Vec<String> = [vec![replaced_string], replace_vec].concat();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
