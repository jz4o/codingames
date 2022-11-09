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
    let mut xs: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let x = input_line.trim_matches('\n').to_string();
        xs.push(x);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const HAPPY_NUMBER: &str = "1";
    const HAPPY_FACE: &str = ":)";
    const UNHAPPY_FACE: &str = ":(";

    let mut results: Vec<String> = Vec::new();
    for x in xs {
        let mut temp: String = x.to_string();

        let mut exit_numbers: Vec<String> = Vec::new();
        exit_numbers.push(HAPPY_NUMBER.to_string());

        while !exit_numbers.contains(&temp) {
            exit_numbers.push(temp.to_string());

            temp = temp.chars().map(|c| c.to_string().parse::<i32>().unwrap().pow(2)).sum::<i32>().to_string();
        }

        let result_face: &str = if temp == HAPPY_NUMBER { HAPPY_FACE } else { UNHAPPY_FACE };

        results.push(format!("{x} {result_face}"));
    }

    // println!("23 :)");
    for result in results {
        println!("{result}");
    }
}
