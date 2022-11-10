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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let side = parse_input!(inputs[0], f64);
    let diameter = parse_input!(inputs[1], f64);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let all_area_size: f64 = side.powf(2.0);
    let circle_area_size: f64 = (diameter / 2.0).powf(2.0) * std::f64::consts::PI;

    let wasteful_circle_count: i32 = ((side / diameter) as i32).pow(2);

    let mut remain_area_size: f64 = all_area_size - (circle_area_size * wasteful_circle_count as f64);

    let mut frugal_circle_count: i32 = wasteful_circle_count;

    let mut remain_side: f64 = remain_area_size.sqrt();
    while diameter <= remain_side {
        let add_circle_count: i32 = ((remain_side / diameter) as i32).pow(2);

        remain_area_size -= circle_area_size * add_circle_count as f64;
        frugal_circle_count += add_circle_count;

        remain_side = remain_area_size.sqrt();
    }

    let result: i32 = frugal_circle_count - wasteful_circle_count;

    // println!("how many more biscuit");
    println!("{result}");
}
