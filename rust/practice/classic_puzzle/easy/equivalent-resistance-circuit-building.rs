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
    let mut name_rs: Vec<(String, i32)> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let name = inputs[0].trim().to_string();
        let r = parse_input!(inputs[1], i32);
        name_rs.push((name, r));
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let circuit = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let left_parts: Vec<&str> = vec!["[", "("];
    let right_parts: Vec<&str> = vec!["]", ")"];

    let mut temp_circuit: String = circuit.to_string();
    for (name, r) in name_rs.iter() {
        temp_circuit = temp_circuit.replace(name, &r.to_string());
    }

    let mut circuit_elements: Vec<String> = temp_circuit.split_whitespace().map(|s| s.to_string()).collect();
    while circuit_elements.len() >= 2 {
        let last_left_part_index: usize = circuit_elements.iter().rposition(|circuit| left_parts.contains(&circuit.as_str())).unwrap();
        let pair_part_elements: Vec<String> = circuit_elements[last_left_part_index..].to_vec();
        let mut pair_right_part_index: usize = pair_part_elements.iter().position(|circuit| right_parts.contains(&circuit.as_str())).unwrap();
        pair_right_part_index += last_left_part_index;

        let last_left_part: String = circuit_elements[last_left_part_index].to_string();

        let calc_fn: fn(Vec<String>) -> f32 = if last_left_part == "[" { calc_parallel } else { calc_series };
        let r: f32 = calc_fn(circuit_elements[last_left_part_index + 1..pair_right_part_index].to_vec());

        for _ in last_left_part_index..pair_right_part_index + 1 {
            circuit_elements.remove(last_left_part_index);
        }
        circuit_elements.insert(last_left_part_index, r.to_string());
    }

    let equivalent_resistance = circuit_elements[0].parse::<f32>().unwrap();
    let result: String = format!("{:.1}", equivalent_resistance);

    // println!("Equivalent Resistance");
    println!("{result}");
}

fn calc_series(rs: Vec<String>) -> f32 {
    return rs.iter().map(|r| r.parse::<f32>().unwrap()).sum();
}

fn calc_parallel(rs: Vec<String>) -> f32 {
    return 1f32 / rs.iter().map(|r| 1f32 / r.parse::<f32>().unwrap()).sum::<f32>();
}
