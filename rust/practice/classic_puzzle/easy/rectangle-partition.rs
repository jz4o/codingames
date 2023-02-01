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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let count_x = parse_input!(inputs[2], i32);
    let count_y = parse_input!(inputs[3], i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut width_measurements: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let x = parse_input!(i, i32);
        width_measurements.push(x);
    }
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut height_measurements: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let y = parse_input!(i, i32);
        height_measurements.push(y);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    width_measurements.insert(0, 0);
    width_measurements.push(w);
    height_measurements.insert(0, 0);
    height_measurements.push(h);

    let mut width_counts: HashMap<i32, i32> = HashMap::new();
    for (index, width_measurement) in width_measurements.iter().enumerate() {
        for width in width_measurements[..index].iter() {
            let k: i32 = width_measurement - width;
            if !width_counts.contains_key(&k) {
                width_counts.insert(k, 0);
            }

            width_counts.insert(k, width_counts[&k] + 1);
        }
    }

    let mut height_counts: HashMap<i32, i32> = HashMap::new();
    for (index, height_measurement) in height_measurements.iter().enumerate() {
        for height in height_measurements[..index].iter() {
            let k: i32 = height_measurement - height;
            if !height_counts.contains_key(&k) {
                height_counts.insert(k, 0);
            }

            height_counts.insert(k, height_counts[&k] + 1);
        }
    }

    for k in width_counts.keys() {
        if !height_counts.contains_key(k) {
            height_counts.insert(*k, 0);
        }
    }

    let result: i32 = width_counts.keys().map(|k| width_counts[k] * height_counts[k]).sum::<i32>();

    // println!("0");
    println!("{result}");
}
