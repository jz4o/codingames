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
    let mut ss: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let s = input_line.trim_matches('\n').to_string();
        ss.push(s);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let border_index: usize = n as usize / 2;
    ss.sort();

    let border_prev: String = ss[border_index - 1].to_string();
    let border_next: String = ss[border_index].to_string();

    let mut border: String = "".to_string();
    let chars: Vec<String> = border_prev.chars().map(|s| s.to_string()).collect();

    for chr in chars {
        let border_char: String = format!("{border}{chr}");
        let border_char_next: String = next_string(border_char.to_string());

        if border_prev <= border_char && border_char < border_next {
            border += &chr;
            break;
        } else if border_prev <= border_char_next && border_char_next < border_next {
            border += &next_string(chr);
            break;
        } else {
            border += &chr;
        }
    }

    let result: String = border;

    // println!("answer");
    println!("{result}");
}

fn int_to_alpha(num: i32) -> String {
    let alphabets: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".to_string();

    let mut result: String = "".to_string();
    let mut i: usize = num as usize;
    while i > 0 {
        let mut mod_num: usize = i % alphabets.len();
        i = i / alphabets.len();
        if mod_num == 0 {
            i -= 1;
            mod_num = alphabets.len();
        }

        result = alphabets.chars().nth(mod_num - 1).unwrap().to_string() + &result;
    }

    return result;
}

fn alpha_to_int(alpha: String) -> i32 {
    let alphabets: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".to_string();

    let mut result: i32 = 0;
    let reverse_alpha: Vec<String> = alpha.chars().map(|s| s.to_string()).rev().collect();
    for index in 0..alpha.len() {
        let alp: String = reverse_alpha[index].to_string();
        result += (alphabets.len().pow(index as u32) * (alphabets.chars().position(|c| c.to_string() == alp).unwrap() + 1)) as i32;
    }

    return result;
}

fn next_string(s: String) -> String {
    return int_to_alpha(alpha_to_int(s) + 1);
}
