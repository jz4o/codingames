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
    let n = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut stage: usize = 0;
    let mut temp_n: usize = n as usize;
    while stage + 1 <= temp_n {
        stage += 1;
        temp_n -= stage;
    }

    const GLASS_PARTS: [&str; 4] = [
        " *** ",
        " * * ",
        " * * ",
        "*****"
    ];
    let width: usize = stage * GLASS_PARTS.first().unwrap().len() + stage - 1;

    let mut results: Vec<String> = Vec::new();
    for step in 1..stage + 1 {
        for glass_part in GLASS_PARTS.iter() {
            let result: String = center(vec![glass_part.to_string(); step].join(" "), width);

            results.push(result);
        }
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

fn center(value: String, length: usize) -> String {
    if length <= value.len() {
        return value;
    }

    let space_length = length - value.len();
    let left_space: String = " ".repeat(space_length / 2);
    let right_space: String = " ".repeat(space_length - left_space.len());

    return format!("{left_space}{value}{right_space}");
}
