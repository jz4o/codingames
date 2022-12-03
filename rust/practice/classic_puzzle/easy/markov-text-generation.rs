e std::io;

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
    let t = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let d = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let l = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let s = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut markov_chain: HashMap<String, Vec<String>> = HashMap::new();
    let t_words: Vec<String> = t.split_whitespace().map(|s| s.to_string()).collect();
    for i in 0..(t_words.len() - d as usize) {
        let mut words: Vec<String> = t_words[i..i + d as usize + 1].to_vec();

        let markov_value: String = words.pop().unwrap();
        let markov_key = words.join(" ");

        if !markov_chain.contains_key(&markov_key) {
            markov_chain.insert(markov_key.to_string(), Vec::new());
        }
        markov_chain.get_mut(&markov_key.to_string()).unwrap().push(markov_value);
    }

    let mut random_seed: usize = 0;
    let mut s_words: Vec<String> = s.split_whitespace().map(|s| s.to_string()).collect();
    for _ in 0..l as usize - s_words.len() {
        random_seed += 7;

        let markov_key: String = s_words[s_words.len() - d as usize..].join(" ");
        let markov_values: Vec<String> = markov_chain[&markov_key.to_string()].to_vec();

        let next_word: String = markov_values[random_seed % markov_values.len()].to_string();

        s_words.push(next_word);
    }

    let result : String = s_words.join(" ");

    // println!("fish is bad and");
    println!("{result}")
}
