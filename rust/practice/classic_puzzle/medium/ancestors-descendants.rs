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
    let count = parse_input!(input_line, i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..count as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut generations: Vec<Generation> = Vec::new();
    for line in lines.iter() {
        let level: usize = line.chars().filter(|c| c == &'.').count();

        generations.push(Generation{level: level, name: line[level..].to_string()});
    }

    let mut results: Vec<String> = Vec::new();
    while !generations.is_empty() {
        let mut result_vec: Vec<String> = Vec::new();
        for l in (0..generations.last().unwrap().level + 1).rev() {
            let generation: &Generation = generations.iter().filter(|generation| generation.level == l).last().unwrap();
            result_vec.insert(0, generation.name.to_string());
        }

        results.insert(0, result_vec.join(" > "));

        let mut temp: Generation = generations.pop().unwrap();
        while !generations.is_empty() && generations.last().unwrap().level < temp.level {
            temp = generations.pop().unwrap();
        }
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Generation {
    level: usize,
    name: String
}
