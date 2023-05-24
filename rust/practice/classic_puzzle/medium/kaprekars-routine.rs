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
    let n_1 = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let digits_size: usize = n_1.len();
    let mut answers: Vec<String> = Vec::new();

    let mut temp_digit: String = n_1.to_string();
    while !answers.contains(&temp_digit) {
        answers.push(temp_digit.to_string());

        let mut digits: Vec<i32> = temp_digit
            .chars()
            .map(|c| c.to_string().parse::<i32>().unwrap())
            .collect();

        digits.sort();
        let smallest: i32 = digits
            .iter()
            .map(|d| d.to_string())
            .collect::<Vec<String>>()
            .join("")
            .parse::<i32>()
            .unwrap();

        digits.reverse();
        let biggest: i32 = digits
            .iter()
            .map(|d| d.to_string())
            .collect::<Vec<String>>()
            .join("")
            .parse::<i32>()
            .unwrap();

        let answer: i32 = biggest - smallest;

        temp_digit = answer.to_string();
        temp_digit = "0".repeat(digits_size - temp_digit.len()) + &temp_digit;
    }

    let begin_index: usize = answers.iter().position(|answer| answer == &temp_digit).unwrap();
    let result: String = answers[begin_index..].join(" ");

    // println!("1 2 3 4");
    println!("{result}");
}
