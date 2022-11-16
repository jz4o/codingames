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
    let l = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let h = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let t = input_line.trim_matches('\n').to_string();
    let mut rows: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();

        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let alphas: Vec<String> = "ABCDEFGHIJKLMNOPQRSTUVWXYZ?".chars().map(|c| c.to_string()).collect();
    let mut results: Vec<String> = vec!["".to_string(); h as usize];

    for s in t.to_uppercase().chars().map(|c| c.to_string()) {
        let i: i32 = if alphas.contains(&s) {
            alphas.iter().position(|alpha| alpha == &s).unwrap() as i32
        } else {
            alphas.len() as i32 - 1
        };

        for r in 0..h as usize {
            let begin_index: usize = (l * i) as usize;
            let end_index: usize = (l * i + l) as usize;
            results[r] += &rows[r][begin_index..end_index];
        }
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
