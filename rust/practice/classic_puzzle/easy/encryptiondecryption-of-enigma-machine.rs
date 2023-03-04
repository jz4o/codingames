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
    let operation = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let pseudo_random_number = parse_input!(input_line, i32);
    let mut rotors: Vec<String> = Vec::new();
    for i in 0..3 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let rotor = input_line.trim_matches('\n').to_string();
        rotors.push(rotor);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let message = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let alphabet_vec: Vec<String> = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".chars().map(|c| c.to_string()).collect();

    let result: String = if operation == "ENCODE" {
        let mut message_chars: Vec<String> = Vec::new();

        for (index, c) in message.chars().enumerate() {
            let alphabet_index: usize = alphabet_vec.iter().position(|alphabet| alphabet.to_string() == c.to_string()).unwrap();
            let message_char: String = alphabet_vec[(alphabet_index + pseudo_random_number as usize + index) % alphabet_vec.len()].to_string();

            message_chars.push(message_char);
        }

        for rotor in rotors.iter() {
            message_chars = message_chars
                .iter()
                .map(|message_char|
                    rotor
                        .chars()
                        .nth(alphabet_vec.iter().position(|alphabet| alphabet.to_string() == message_char.to_string()).unwrap())
                        .unwrap()
                        .to_string()
                )
                .collect();
        }

        message_chars.join("")
    } else {
        let mut message_chars: Vec<String> = message.chars().map(|c| c.to_string()).collect();

        for rotor in rotors.iter().rev() {
            message_chars = message_chars
                .iter()
                .map(|message_char|
                    alphabet_vec[rotor.chars().position(|r| r.to_string() == message_char.to_string()).unwrap()].to_string())
                .collect();
        }

        let mut temp_message_chars: Vec<String> = Vec::new();
        for (index, c) in message_chars.iter().enumerate() {
            let mut alphabet_index: i32 = alphabet_vec.iter().position(|alphabet| alphabet.to_string() == c.to_string()).unwrap() as i32;
            alphabet_index -= pseudo_random_number;
            alphabet_index -= index as i32;
            alphabet_index %= alphabet_vec.len() as i32;

            if alphabet_index < 0 {
                alphabet_index += alphabet_vec.len() as i32;
            }

            let message_char: String = alphabet_vec[alphabet_index as usize].to_string();
            temp_message_chars.push(message_char);
        }
        message_chars = temp_message_chars;

        message_chars.join("")
    };

    // println!("message");
    println!("{result}");
}
