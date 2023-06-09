use std::io;

use std::collections::HashMap;
use std::collections::HashSet;

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
    let mut actions: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let action = input_line.trim_matches('\n').to_string();
        actions.push(action);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let nb_orders = parse_input!(input_line, i32);
    let mut orders: Vec<String> = Vec::new();
    for i in 0..nb_orders as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let order = input_line.trim_matches('\n').to_string();
        orders.push(order);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut require_actions: HashMap<String, Vec<String>> = HashMap::new();
    for order in orders.iter() {
        let (first, second, third): (String, String, String) = order.split_whitespace().map(|s| s.to_string()).collect_tuple().unwrap();
        let (before, after): (String, String)  = if second == "before" {
            (first, third)
        } else {
            (third, first)
        };

        if !require_actions.contains_key(&after) {
            require_actions.insert(after.to_string(), Vec::new());
        }
        require_actions.get_mut(&after).unwrap().push(before.to_string());
    }

    let uniq_actions: HashSet<String> = actions.iter().map(|action| action.to_string()).collect();
    let require_action_keys: HashSet<String> = require_actions.keys().map(|k| k.to_string()).collect();
    let mut available_actions: Vec<String> = uniq_actions.difference(&require_action_keys).map(|action| action.to_string()).collect();

    let mut temp_actions: Vec<String> = actions.to_vec();

    let mut results: Vec<String> = Vec::new();
    while !temp_actions.is_empty() {
        let action: String = temp_actions.iter().find(|temp_action| available_actions.contains(temp_action)).unwrap().to_string();

        available_actions.retain(|available_action| available_action.to_string()!= action);
        temp_actions.retain(|temp_action| temp_action.to_string() != action);

        for value_vec in require_actions.values_mut() {
            value_vec.retain(|value| value.to_string() != action);
        }

        let unlock_actions: Vec<String> = require_actions.iter().filter(|(k, v)| v.is_empty()).map(|(k, v)| k.to_string()).collect();

        available_actions.extend(unlock_actions.to_vec());
        for unlock_action in unlock_actions.iter() {
            require_actions.remove(unlock_action);
        }

        results.push(action.to_string());
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
