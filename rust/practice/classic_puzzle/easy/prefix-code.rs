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
    let mut input_rows: Vec<(String, i32)> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let b = inputs[0].trim().to_string();
        let c = parse_input!(inputs[1], i32);
        input_rows.push((b, c));
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let s = input_line.trim().to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut prefix_codes: Vec<PrefixCode> = input_rows
        .iter()
        .map(|(b, c)| PrefixCode{binary: b.to_string(), char: char::from_u32(*c as u32).unwrap().to_string()})
        .collect();

    prefix_codes.sort_by(|a, b| b.binary.len().partial_cmp(&a.binary.len()).unwrap());

    let mut temp_s: String = s.to_string();

    let mut result: String = "".to_string();
    while temp_s.len() > 0 {
        let filterd_prefix_codes: Vec<&PrefixCode> = prefix_codes
            .iter()
            .filter(|prefix_code| temp_s.starts_with(&prefix_code.binary.to_string()))
            .collect();

        if filterd_prefix_codes.len() == 0 {
            result = format!("DECODE FAIL AT INDEX {}", s.len() - temp_s.len());
            break;
        }

        let prefix_code: &PrefixCode = filterd_prefix_codes.first().unwrap();

        temp_s = temp_s.replacen(&prefix_code.binary, "", 1);
        result += &prefix_code.char;
    }

    // println!("abracadabra");
    println!("{result}");
}

struct PrefixCode {
    binary: String,
    char: String
}
