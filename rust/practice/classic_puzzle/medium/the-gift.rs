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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let c = parse_input!(input_line, i32);
    let mut budgets: Vec<i32> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let b = parse_input!(input_line, i32);

        budgets.push(b);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();
    if budgets.iter().sum::<i32>() < c {
        results.push("IMPOSSIBLE".to_string());
    } else {
        let mut lack: i32 = c;
        budgets.sort_unstable();

        for (index, budget) in budgets.iter().enumerate() {
            let average: i32 = lack / (budgets.len() - index) as i32;
            let pay: i32 = *[*budget, average].iter().min().unwrap();

            lack -= pay;

            results.push(pay.to_string());
        }
    }

    // println!("IMPOSSIBLE");
    for result in results {
        println!("{}", result);
    }
}
