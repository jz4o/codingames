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
    let a = parse_input!(inputs[0], i32);
    let b = parse_input!(inputs[1], i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut high: i32 = *[a, b].iter().max().unwrap();
    let mut low: i32 = *[a, b].iter().min().unwrap();

    let mut results: Vec<String> = Vec::new();
    results.push(format!("{high} * {low}"));

    let mut add_nums: String = "".to_string();
    while low != 0 {
        if low % 2 == 0 {
            high *= 2;
            low /= 2;
        } else {
            add_nums += &format!(" + {high}");
            low -= 1;
        }

        results.push(format!("= {high} * {low}{add_nums}"));
    }

    results.push(format!("= {}", a * b));

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
