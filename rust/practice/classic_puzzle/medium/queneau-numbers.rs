use std::{io, ops::Div};

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
    let n = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let initial_vec: Vec<i32> = (1..n + 1).collect_vec();
    let center_index: usize = n as usize / 2;

    let mut temp_vec: Vec<i32> = initial_vec.to_vec();
    let mut progress_logs: Vec<String> = Vec::new();
    for _ in 0..n {
        let front_half: Vec<i32> = temp_vec[..center_index].to_vec();
        let back_half: Vec<i32> = temp_vec[center_index..].to_vec();

        temp_vec.clear();

        for i in 0..(n as f32).div(2f32).ceil() as usize {
            if i < back_half.len() {
                temp_vec.push(back_half[back_half.len() - (i + 1)]);
            }

            if i < front_half.len() {
                temp_vec.push(front_half[i]);
            }
        }

        progress_logs.push(temp_vec.iter().map(|t| t.to_string()).collect::<Vec<String>>().join(","));
    }

    let str_temp: String = temp_vec.iter().map(|t| t.to_string()).collect::<Vec<String>>().join(",");
    let str_initial: String = initial_vec.iter().map(|v| v.to_string()).collect::<Vec<String>>().join(",") ;
    let results: Vec<String> = if str_temp == str_initial {
        progress_logs.to_vec()
    } else {
        vec!["IMPOSSIBLE".to_string()]
    };

    // println!("IMPOSSIBLE");
    for result in results {
        println!("{result}");
    }
}
