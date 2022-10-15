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
    let r = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let v = parse_input!(input_line, i32);
    let mut input_values: Vec<InputValue> = Vec::new();
    for i in 0..v as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let c = parse_input!(inputs[0], i32);
        let n = parse_input!(inputs[1], i32);

        input_values.push(InputValue { c: c, n: n })
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut robbers: Vec<i32> = Vec::new();
    for _ in 0..r {
        robbers.push(0);
    }
    for input_value in input_values {
        let n: u32 = input_value.n as u32;
        let c: u32 = input_value.c as u32;

        let vault_time: i32 = 10i32.pow(n) * 5i32.pow(c - n);

        let min_vault_time: i32 = *robbers.iter().min().unwrap();
        let target_index: usize = robbers.iter().position(|&time| time == min_vault_time).unwrap();

        robbers[target_index] += vault_time;
    }

    let result: i32 = *robbers.iter().max().unwrap();

    // println!("1");
    println!("{result}");
}

struct InputValue {
    c: i32,
    n: i32
}
