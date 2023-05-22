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
    let n = parse_input!(input_line, i32); // the number of relationships of influence
    let mut input_lines: Vec<(i32, i32)> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let x = parse_input!(inputs[0], i32); // a relationship of influence between two people (x influences y)
        let y = parse_input!(inputs[1], i32);

        input_lines.push((x, y));
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut relations: HashMap<i32, Vec<i32>> = HashMap::new();
    for (x, y) in input_lines.iter() {
        if !relations.contains_key(x) {
            relations.insert(*x, Vec::new());
        }

        relations.get_mut(x).unwrap().push(*y);
    }

    let mut targets: Vec<i32> = relations.keys().map(|&k| k).collect();
    let mut deep_level: usize = 0;
    while !targets.is_empty() {
        deep_level += 1;

        targets = targets
            .iter()
            .filter(|target| relations.contains_key(target))
            .flat_map(|target| relations[target].to_vec())
            .collect();
    }

    let result: usize = deep_level;

    // The number of people involved in the longest succession of influences
    // println!("2");
    println!("{result}");
}
