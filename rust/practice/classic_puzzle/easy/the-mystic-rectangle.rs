use std::io;

use std::cmp::min;

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
    let x = parse_input!(inputs[0], i32);
    let y = parse_input!(inputs[1], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let u = parse_input!(inputs[0], i32);
    let v = parse_input!(inputs[1], i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let x_distance: i32 = min((x - u).abs(), 200 - (x - u).abs());
    let y_distance: i32 = min((y - v).abs(), 150 - (y - v).abs());

    let mut time: f32 = 0.0;
    time += min(x_distance, y_distance) as f32 * 0.5;
    time += (y_distance - x_distance).abs() as f32 * (if x_distance < y_distance { 0.4 } else { 0.3 });

    let result: String = format!("{:.1}", time);

    // println!("0.0");
    println!("{result}");
}
