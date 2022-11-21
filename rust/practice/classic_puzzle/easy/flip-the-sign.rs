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
    let height = parse_input!(inputs[0], i32);
    let width = parse_input!(inputs[1], i32);
    let mut lines1: Vec<String> = Vec::new();
    for i in 0..height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines1.push(line);
    }
    let mut lines2: Vec<String> = Vec::new();
    for i in 0..height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines2.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let lines1_numbers: Vec<i32> = lines1.join(" ").split_whitespace().map(|n| n.parse::<i32>().unwrap()).collect();
    let lines2_marks: Vec<String> = lines2.join(" ").split_whitespace().map(|s| s.to_string()).collect();

    let x_numbers: Vec<i32> = (0..lines1_numbers.len()).filter(|&i| lines2_marks[i] == "X").map(|i| lines1_numbers[i]).collect();
    let x_positive_booleans: Vec<bool> = x_numbers.iter().map(|&number| number > 0).collect();

    let result: String = if x_positive_booleans.len() > 0 {
        (0..x_positive_booleans.len() - 1).all(|i| x_positive_booleans[i] != x_positive_booleans[i + 1]).to_string()
    } else {
        "true".to_string()
    };

    // println!("true/false");
    println!("{result}");
}
