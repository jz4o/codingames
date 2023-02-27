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
    let n = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let xthen_commands = input_line.trim_matches('\n').to_string();
    let mut rthen_roadpatterns: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let rthen_roadpattern = input_line.trim_matches('\n').to_string();
        rthen_roadpatterns.push(rthen_roadpattern);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let xthen_command_elements: Vec<&str> = xthen_commands.split(";").collect();

    let mut position: usize = xthen_command_elements.first().unwrap().parse::<usize>().unwrap();

    let mut commands: Vec<String> = Vec::new();
    for command in xthen_command_elements[1..].iter() {
        let mut command_chars: Vec<String> = command.chars().map(|c| c.to_string()).collect();

        let command_char: String = command_chars.pop().unwrap();
        for _ in 0..command_chars.join("").parse::<i32>().unwrap() {
            commands.push(command_char.to_string());
        }
    }

    let mut results: Vec<String> = Vec::new();
    for (index, rthen_roadpattern) in rthen_roadpatterns.iter().enumerate() {
        let (count, pattern): (&str, &str) = rthen_roadpattern.split(";").collect_tuple().unwrap();

        for _ in 0..count.parse::<i32>().unwrap() {
            let command: String = commands.remove(0);

            match command.as_str() {
                "L" => position -= 1,
                "R" => position += 1,
                _ => ()
            }

            let output_pattern: String = format!("{}#{}", pattern[..position - 1].to_string(), pattern[position..].to_string());

            results.push(output_pattern);
        }
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
