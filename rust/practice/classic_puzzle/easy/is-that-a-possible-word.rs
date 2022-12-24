use std::io;

use std::collections::HashMap;

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
    let input = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let states = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let number_of_transitions = parse_input!(input_line, i32);
    let mut transitions: Vec<String> = Vec::new();
    for i in 0..number_of_transitions as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let transition = input_line.trim_matches('\n').to_string();
        transitions.push(transition);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let start_state = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let end_states = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let number_of_words = parse_input!(input_line, i32);
    let mut words: Vec<String> = Vec::new();
    for i in 0..number_of_words as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let word = input_line.trim_matches('\n').to_string();
        words.push(word);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let state_list: Vec<String> = states.split_whitespace().map(|s| s.to_string()).collect::<Vec<String>>();
    let end_state_list: Vec<String> = end_states.split_whitespace().map(|s| s.to_string()).collect::<Vec<String>>();

    let mut transition_hash: HashMap<String, HashMap<String, String>> = HashMap::new();
    for state in state_list {
        transition_hash.insert(state, HashMap::new());
    }
    for transition in transitions {
        let (from_state, chr, to_state): (String, String, String) = transition.split_whitespace().map(|s| s.to_string()).collect_tuple().unwrap();
        transition_hash.get_mut(&from_state).unwrap().insert(chr, to_state);
    }

    let mut results: Vec<String> = Vec::new();
    for word in words {
        let empty_string: String = "".to_string();

        let mut state: &String = &start_state;
        for chr in word.chars().map(|c| c.to_string()) {
            if !transition_hash.contains_key(state) || !transition_hash.get(state).unwrap().contains_key(&chr) {
                state = &empty_string;
                break;
            }

            state = transition_hash.get(state).unwrap().get(&chr).unwrap();
        }
        let end_state = state;

        let result: String = (end_state_list.contains(end_state)).to_string().to_lowercase();

        results.push(result);
    }

    // println!("true or false");
    for result in results {
        println!("{result}");
    }
}
