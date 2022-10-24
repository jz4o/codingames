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
    let typed_keys = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut before_chars: Vec<String> = Vec::new();
    let mut after_chars: Vec<String> = Vec::new();

    for chr in typed_keys.chars() {
        if chr == '<' {
            if before_chars.len() > 0 {
                after_chars.insert(0, before_chars.pop().unwrap());
            }
        } else if chr == '>' {
            if after_chars.len() > 0 {
                before_chars.push(after_chars.remove(0));
            }
        } else if chr == '-' {
            if before_chars.len() > 0 {
                before_chars.pop();
            }
        } else {
            before_chars.push(chr.to_string());
        }
    }

    let result = before_chars.join("") + &after_chars.join("");

    // println!("computed text");
    println!("{result}")
}
