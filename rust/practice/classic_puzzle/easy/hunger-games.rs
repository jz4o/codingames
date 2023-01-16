use std::io;

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
    let tributes = parse_input!(input_line, i32);
    let mut player_names: Vec<String> = Vec::new();
    for i in 0..tributes as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let player_name = input_line.trim_matches('\n').to_string();
        player_names.push(player_name);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let turns = parse_input!(input_line, i32);
    let mut infos: Vec<String> = Vec::new();
    for i in 0..turns as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let info = input_line.trim_matches('\n').to_string();
        infos.push(info);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut tribute_hash: HashMap<String, HashMap<&str, Vec<String>>> = HashMap::new();

    for info in infos {
        let mut info_elements: Vec<String> = info.split_whitespace().map(|s| s.to_string()).collect();
        let killer: String = info_elements.remove(0);
        info_elements.remove(0);

        if !tribute_hash.contains_key(&killer) {
            tribute_hash.insert(killer.to_string(), HashMap::new());
            tribute_hash.get_mut(&killer).unwrap().insert("killer", Vec::new());
            tribute_hash.get_mut(&killer).unwrap().insert("killed", Vec::new());
        }

        for info_element in info_elements {
            let killed: String = info_element.replace(",", "");
            if !tribute_hash.contains_key(&killed) {
                tribute_hash.insert(killed.to_string(), HashMap::new());
                tribute_hash.get_mut(&killed).unwrap().insert("killer", Vec::new());
                tribute_hash.get_mut(&killed).unwrap().insert("killed", Vec::new());
            }

            tribute_hash.get_mut(&killed).unwrap().get_mut("killer").unwrap().push(killer.to_string());
            tribute_hash.get_mut(&killer).unwrap().get_mut("killed").unwrap().push(killed.to_string());
        }
    }

    player_names.sort();

    let mut results: Vec<String> = Vec::new();
    for player_name in player_names {
        let result: &mut HashMap<&str, Vec<String>> = tribute_hash.get_mut(&player_name).unwrap();
        result.get_mut("killed").unwrap().sort();

        let killed: String = if result["killed"].is_empty() {
            "None".to_string()
        } else {
            result["killed"].join(", ")
        };

        let killer: String = if result["killer"].is_empty() {
            "Winner".to_string()
        } else {
            result["killer"].first().unwrap().to_string()
        };

        results.push(format!("Name: {player_name}"));
        results.push(format!("Killed: {killed}"));
        results.push(format!("Killer: {killer}"));
        results.push("".to_string()); // for empty line
    }

    // remove last empty line
    results.pop();

    // println!("Name:");
    // println!("Killed:");
    // println!("Killer:");
    for result in results {
        println!("{result}");
    }
}
