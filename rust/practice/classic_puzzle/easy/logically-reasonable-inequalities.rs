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
    let n = parse_input!(input_line, i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut inheritances: HashMap<String, Vec<String>> = HashMap::new();
    for row in rows {
        let (parent, child): (&str, &str) = row.split_once(" > ").unwrap();

        if !inheritances.contains_key(parent) {
            inheritances.insert(parent.to_string(), Vec::new());
        }

        inheritances.get_mut(parent).unwrap().push(child.to_string());
    }

    let mut temps: Vec<Vec<&String>> = inheritances.keys().map(|k| vec![k]).collect();
    let mut is_break: bool = false;
    while temps.len() > 0 {
        let temp: Vec<&String> = temps.pop().unwrap();

        if inheritances.contains_key(&temp.last().unwrap().to_string()) {
            for inheritance_child in inheritances[&temp.last().unwrap().to_string()].iter() {
                let mut cloned_temp: Vec<&String> = temp.to_vec();
                cloned_temp.push(inheritance_child);

                temps.push(cloned_temp);

                if temp.contains(&inheritance_child) {
                    is_break = true;
                    break;
                }
            }
        }

        if is_break {
            break;
        }
    }

    let result: &str = if temps.is_empty() { "consistent" } else { "contradiction" };

    // println!("consistent/contradiction");
    println!("{result}");
}
