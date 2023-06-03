use std::io;

use itertools::Itertools;

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
    let x = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let x_elements: Vec<&str> = x.split("-").collect();
    let ab: String = x_elements[0].to_string();
    let cde: i32 = x_elements[1].to_string().parse::<i32>().unwrap();
    let fg: String = x_elements[2].to_string();

    let alpha_int: i32 = alpha_to_int(format!("{ab}{fg}"));

    let carry: i32 = (cde + n - 1) / 999;
    let alpha: String = int_to_alpha(alpha_int + carry);

    let next_ab: String = alpha[..2].to_string();
    let next_cde: String = format!("{:0>3}", (cde + n - 1) % 999 + 1);
    let next_fg: String = alpha[alpha.len() - 2..].to_string();

    let result: String = [next_ab, next_cde, next_fg].iter().join("-");

    // println!("AA-000-AA");
    println!("{result}");
}

fn alpha_to_int(alpha: String) -> i32 {
    let alphabets: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".to_string();

    let mut result: i32 = 0;
    for (index, c) in alpha.chars().rev().enumerate() {
        let alpha_index: usize = alphabets.chars().position(|a| a == c).unwrap() + 1;

        result += (alphabets.len().pow(index as u32) * alpha_index) as i32;
    }

    return result;
}

fn int_to_alpha(int: i32) -> String {
    let alphabets: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".to_string();

    let mut result: String = "".to_string();

    let mut alpha_int: usize = int as usize;
    while alpha_int > 0 {
        let mut i: usize = alpha_int as usize % alphabets.len();
        if i == 0 {
            i = alphabets.len();
            alpha_int -= 1;
        }

        alpha_int = if alpha_int > alphabets.len() {
            alpha_int / alphabets.len()
        } else {
            0
        };

        result = format!("{}{}", alphabets.chars().nth(i - 1).unwrap(), result);
    }

    return result;
}
