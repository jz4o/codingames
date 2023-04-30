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
    let n = parse_input!(input_line, i32);
    let mut c_grid: Vec<Vec<i32>> = Vec::new();
    for i in 0..n as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut c_row: Vec<i32> = Vec::new();
        for j in inputs.split_whitespace() {
            let c = parse_input!(j, i32);
            c_row.push(c);
        }
        c_grid.push(c_row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const PARIS_LABEL: i32 = 1;
    const ROME_LABEL: i32 = 100;

    let mut city_relations: HashMap<i32, Vec<i32>> = HashMap::new();
    for c_row in c_grid.iter() {
        let (a, b): (&i32, &i32) = c_row.iter().collect_tuple().unwrap();

        if !city_relations.contains_key(a) {
            city_relations.insert(*a, Vec::new());
        }

        if !city_relations.contains_key(b) {
            city_relations.insert(*b, Vec::new());
        }

        city_relations.get_mut(a).unwrap().push(*b);
        city_relations.get_mut(b).unwrap().push(*a);
    }

    let mut route_patterns: Vec<Vec<i32>> = Vec::new();
    let mut temp_route_patterns: Vec<Vec<i32>> = vec![vec![PARIS_LABEL]];
    while !temp_route_patterns.is_empty() {
        let temp_route_pattern: Vec<i32> = temp_route_patterns.pop().unwrap();
        let last_city_label: i32 = *temp_route_pattern.last().unwrap();

        for next_city_label in city_relations[&last_city_label].iter() {
            if temp_route_pattern.contains(&next_city_label) {
                continue;
            }

            if next_city_label == &ROME_LABEL {
                route_patterns.push([temp_route_pattern.to_vec(), vec![*next_city_label]].concat());
                continue;
            }

            temp_route_patterns.push([temp_route_pattern.to_vec(), vec![*next_city_label]].concat());
        }
    }

    let result: usize = route_patterns.len();

    // println!("answer");
    println!("{result}");
}
