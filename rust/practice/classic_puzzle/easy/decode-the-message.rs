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
    let p = parse_input!(input_line, i64);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let c = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut result: String = "".to_string();
    let mut i: usize = p as usize + 1;
    while i > 0 {
        let mut mod_num: usize = i % c.len();
        i = i / c.len();

        if mod_num == 0 {
            mod_num = c.len();
            i -= 1;
        }

        result += &c.chars().nth(mod_num - 1).unwrap().to_string();
    }

    // println!("Good Luck :->");
    println!("{result}");
}
