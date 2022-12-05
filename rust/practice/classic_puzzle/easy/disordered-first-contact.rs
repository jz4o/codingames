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
    let message = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let f: fn(String) -> String = if n > 0 { decode } else { encode };

    let mut result: String = message.to_string();
    for _ in 0..n.abs() {
        result = f(result);
    }

    // println!("answer");
    println!("{result}");
}

fn decode(text: String) -> String {
    let mut temp_text: String = text.to_string();

    let mut turn: usize = 1;
    while (1..turn + 1).sum::<usize>() < temp_text.len() {
        turn += 1;
    }

    let mut result: String = "".to_string();
    while turn > 0 {
        let slice_size: usize = temp_text.len() - (1..turn).sum::<usize>();

        if turn % 2 == 1 {
            result = format!("{}{}", temp_text[temp_text.len() - slice_size..temp_text.len()].to_string(), result);
            temp_text = temp_text[0..temp_text.len() - slice_size].to_string();
        } else {
            result = format!("{}{}", temp_text[0..slice_size].to_string(), result);
            temp_text = temp_text[slice_size..temp_text.len()].to_string();
        }

        turn -= 1;
    }

    return result;
}

fn encode(text: String) -> String {
    let mut temp_text: String = text.to_string();

    let mut turn: usize = 1;

    let mut target: String = temp_text[0..turn].to_string();
    temp_text = temp_text[turn..temp_text.len()].to_string();

    let mut result: String = "".to_string();
    while target.len() > 0 {
        if turn % 2 == 1 {
            result += &target;
        } else {
            result = format!("{target}{result}");
        }

        turn += 1;

        target = temp_text[0..*[turn, temp_text.len()].iter().min().unwrap()].to_string();
        temp_text = if turn < temp_text.len() { temp_text[turn..temp_text.len()].to_string() } else { "".to_string() };
    }

    return result;
}
