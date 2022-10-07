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

    let width: usize = n as usize * 4 - 1;

    let mut upper_part: String = "".to_string();
    let mut lower_part: String = "".to_string();
    for i in 1..n + 1 {
        let part: &str = &"*".to_string().repeat(i as usize * 2 - 1);

        let upper_left_space_part: &str = &" ".to_string().repeat((width - part.len()) / 2);
        upper_part = upper_part + upper_left_space_part + part + "\n";

        let lower_space_part: &str = &" ".to_string().repeat((n - i + 1) as usize * 2 - 1);
        let lower_line: &str = &(part.to_owned() + lower_space_part + part);
        let lower_left_space_part: &str = &" ".to_string().repeat((width - lower_line.len()) / 2);
        lower_part = lower_part + lower_left_space_part + lower_line + "\n";
    }

    upper_part = upper_part.replacen(" ", ".", 1);
    lower_part.pop();

    let result: String = upper_part + &lower_part;

    // println!("answer");
    println!("{result}");
}
