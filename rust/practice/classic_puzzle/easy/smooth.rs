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
    let mut fs: Vec<i64> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let f = parse_input!(input_line, i64);
        fs.push(f);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<&str> = Vec::new();
    for f in fs {
        let mut temp_f: i64 = f;
        for i in [5, 3, 2] {
            while temp_f % i == 0 {
                temp_f /= i;
            }
        }

        results.push(if temp_f == 1 { "VICTORY" } else { "DEFEAT" });
    }

    // println!("DEFEAT");
    for result in results {
        println!("{result}");
    }
}
