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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let deck = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut result: String = deck;
    for _ in 0..n {
        result = faro_shuffle(result);
    }

    // println!("answer");
    println!("{result}");
}

fn faro_shuffle(deck: String) -> String {
    let splited_deck: Vec<String> = deck.split_whitespace().map(|s| s.to_string()).collect();

    let half_index: usize = (splited_deck.len() as f32 / 2.0).ceil() as usize;

    let mut front_half: Vec<String> = Vec::new();
    for i in 0..half_index {
        front_half.push(splited_deck[i].to_string());
    }

    let mut back_half: Vec<String> = Vec::new();
    for i in half_index..splited_deck.len() {
        back_half.push(splited_deck[i].to_string());
    }
    if splited_deck.len() % 2 == 1 {
        back_half.push("".to_string());
    }

    let mut vec: Vec<String> = Vec::new();
    for i in 0..front_half.len() {
        if front_half[i] != "" {
            vec.push(front_half[i].to_string());
        }
        if back_half[i] != "" {
            vec.push(back_half[i].to_string());
        }
    }

    let result: String = vec.join(" ");

    return result;
}
