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
    let order = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let side = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut layers: HashMap<String, i32> = HashMap::from([
        ("R".to_string(), 1),
        ("L".to_string(), 1),
        ("U".to_string(), 1),
        ("D".to_string(), 1)
    ]);
    let across_groups: [[String; 2]; 2] = [
        ["R".to_string(), "L".to_string()],
        ["U".to_string(), "D".to_string()]
    ];

    for o in order.chars() {
        for across_group in across_groups.iter() {
            if across_group.contains(&o.to_string()) {
                let ag: String = across_group
                    .iter()
                    .find(|ag| !ag.contains(&o.to_string()))
                    .unwrap()
                    .to_string();

                layers.insert(ag.to_string(), layers[&ag.to_string()] + layers[&o.to_string()]);
            } else {
                for ag in across_group.iter() {
                    layers.insert(ag.to_string(), layers[&ag.to_string()] * 2);
                }
            }
        }

        layers.insert(o.to_string(), 1);
    }

    let result: String = layers[&side].to_string();

    // println!("1");
    println!("{result}");
}
