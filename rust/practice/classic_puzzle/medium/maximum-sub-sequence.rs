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
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut ls: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let l = parse_input!(i, i32);
        ls.push(l);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut sequences: Vec<Vec<i32>> = Vec::new();
    for l in ls.iter() {
        for sequence in sequences.iter_mut() {
            if sequence.last().unwrap() + 1 == *l {
                sequence.push(*l);
            }
        }

        sequences.push(vec![*l]);
    }

    let max_size: usize = sequences.iter().map(|sequence| sequence.len()).max().unwrap();
    let result_sequence: &Vec<i32> = sequences.iter().rev().find(|sequence| sequence.len() == max_size).unwrap();
    let result: String = result_sequence.iter().map(|i| i.to_string()).collect::<Vec<String>>().join(" ");

    // println!("1 2 3 4 5");
    println!("{result}");
}
