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

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut base: i32 = 2;
    let mut step: i32 = 2;
    let mut max_num: i32 = n;
    while base < max_num {
        let prev_max: i32 = max_num;
        max_num = ((max_num - base) / step) * step + base;

        if prev_max == max_num {
            base += step;
        }

        step *= 2;
    }

    let result: String = max_num.to_string();

    // println!("answer");
    println!("{result}");
}
