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
    let c = parse_input!(input_line, i32);
    let mut wirings: Vec<String> = Vec::new();
    for i in 0..c as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let wiring = input_line.trim_matches('\n').to_string();
        wirings.push(wiring);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let a = parse_input!(input_line, i32);
    let mut switches: Vec<String> = Vec::new();
    for i in 0..a as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let switch = input_line.trim_matches('\n').to_string();
        switches.push(switch);
    }
    let mut switch_status: HashMap<String, bool> = HashMap::new();
    for switch in switches.iter().collect::<HashSet<&String>>() {
        let count: usize = switches.iter().filter(|&s| s == switch).count();
        switch_status.insert(switch.to_string(), count % 2 == 1);
    }
    let description_types: Vec<String> = vec!["-".to_string(), "=".to_string()];
    for i in 0..c as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let wiring: String = wirings[i].to_string();
        let mut wiring_elements: Vec<String> = wiring.split_whitespace().map(|s| s.to_string()).collect();

        let equipment: String = wiring_elements.remove(0);
        let mut equipment_description_switches: Vec<bool> = Vec::new();
        while wiring_elements.len() > 0 {
            let description_type_index: usize = (0..wiring_elements.len()).rev().find(|index| description_types.contains(&wiring_elements[*index])).unwrap();

            let description_type: String = wiring_elements[description_type_index].to_string();
            let description_switches: Vec<String> = wiring_elements[description_type_index + 1..].to_vec();
            wiring_elements = wiring_elements[..description_type_index].to_vec();

            let description_switch_statuses: Vec<bool> = description_switches.iter().map(|s| *switch_status.get(s).unwrap_or(&false)).collect();
            if description_type == "-" {
                equipment_description_switches.push(description_switch_statuses.iter().all(|&status| status));
            } else {
                equipment_description_switches.push(description_switch_statuses.iter().any(|&status| status));
            }
        }

        let equipment_status: String = if equipment_description_switches.iter().all(|&switch| switch) {"ON".to_string()} else {"OFF".to_string()};
        let result: String = format!("{equipment} is {equipment_status}");

        // println!("ANSWER");
        println!("{result}");
    }
}
