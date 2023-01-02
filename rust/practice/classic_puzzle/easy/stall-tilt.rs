use std::io;

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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let v = parse_input!(input_line, i32);
    let mut speeds: Vec<i32> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let speed = parse_input!(input_line, i32);
        speeds.push(speed);
    }
    let mut bends: Vec<i32> = Vec::new();
    for i in 0..v as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let bend = parse_input!(input_line, i32);
        bends.push(bend);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let alphabets: String = "abcdefghijklmnopqrstuvwxyz".to_string();

    let motorcycles: Vec<Motorcycle> = speeds
        .iter()
        .enumerate()
        .map(|(index, speed)| Motorcycle {name: alphabets.chars().nth(index).unwrap().to_string(), speed: *speed})
        .collect();

    let mut reference_motorcycles: Vec<&Motorcycle> = motorcycles.iter().map(|motorcycle| motorcycle).collect();
    let mut staled_motorcycles: Vec<&Motorcycle> = Vec::new();

    let border_tan: f32 = (60.0 * std::f32::consts::PI / 180.0).tan();
    const G: f32 = 9.81;

    let mut border_speeds: Vec<f32> = Vec::new();
    for bend in bends.iter() {
        let border_speed: f32 = (border_tan * *bend as f32 * G).sqrt();
        border_speeds.push(border_speed);

        let bend_staled_motorcycles: Vec<&Motorcycle> = reference_motorcycles
            .iter()
            .filter(|motorcycle| border_speed < motorcycle.speed as f32)
            .sorted_by(|a, b| b.speed.partial_cmp(&a.speed).unwrap())
            .map(|motorcycle| *motorcycle)
            .collect::<Vec<&Motorcycle>>();

        reference_motorcycles = reference_motorcycles
            .iter()
            .filter(|motorcycle| !bend_staled_motorcycles.contains(&motorcycle))
            .map(|motorcycle| *motorcycle)
            .collect();

        staled_motorcycles = bend_staled_motorcycles
            .iter()
            .chain(staled_motorcycles.iter())
            .map(|motorcycle| *motorcycle)
            .collect();
    }

    reference_motorcycles.sort_by(|a, b| b.speed.partial_cmp(&a.speed).unwrap());

    let mut results: Vec<String> = Vec::new();
    results.push(border_speeds.iter().map(|s| *s as i32).min().unwrap().to_string());
    results.push("y".to_string());
    results.extend(reference_motorcycles.iter().map(|motorcycle| motorcycle.name.to_string()));
    results.extend(staled_motorcycles.iter().map(|motorcycle| motorcycle.name.to_string()));

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

#[derive(Debug,PartialEq)]
struct Motorcycle {
    name: String,
    speed: i32
}
