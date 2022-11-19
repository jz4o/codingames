use std::io;

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
    let mut strengths: Vec<Strength> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let v = parse_input!(inputs[0], i32);
        let e = parse_input!(inputs[1], i32);

        strengths.push(Strength{v, e});
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut distances: Vec<i32> = Vec::new();
    for left_index in 0..strengths.len() {
        let left: &Strength = strengths.get(left_index).unwrap();
        for right_index in left_index + 1..strengths.len() {
            let right: &Strength = strengths.get(right_index).unwrap();

            let distance: i32 = (right.v - left.v).abs() + (right.e - left.e).abs();
            distances.push(distance);
        }
    }

    let result: i32 = *distances.iter().min().unwrap();

    // println!("42");
    println!("{result}");
}

struct Strength {
    v: i32,
    e: i32
}
