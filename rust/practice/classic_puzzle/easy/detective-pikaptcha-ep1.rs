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
    let width = parse_input!(inputs[0], i32);
    let height = parse_input!(inputs[1], i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim().to_string();
        lines.push(line);
    }
    for h in 0..height as usize {

        // Write an action using println!("message...");
        // To debug: eprintln!("Debug message...");

        let mut result: String = "".to_string();
        for w in 0..width as usize {
            let value: String = lines.get(h).unwrap().to_string().chars().nth(w).unwrap().to_string();
            if value == "#" {
                result += &value;
                continue;
            }

            let mut around_chars: Vec<String> = Vec::new();
            if h != 0 {
                around_chars.push(lines.get(h - 1).unwrap().to_string().chars().nth(w).unwrap().to_string());
            }
            if w != 0 {
                around_chars.push(lines.get(h).unwrap().to_string().chars().nth(w - 1).unwrap().to_string());
            }
            if w + 1 != width as usize {
                around_chars.push(lines.get(h).unwrap().to_string().chars().nth(w + 1).unwrap().to_string());
            }
            if h + 1 != height as usize {
                around_chars.push(lines.get(h + 1).unwrap().to_string().chars().nth(w).unwrap().to_string());
            }

            result += &around_chars.iter().filter(|&c| c == "0").count().to_string();
        }

        // println!("#####");
        println!("{result}");
    }
}
