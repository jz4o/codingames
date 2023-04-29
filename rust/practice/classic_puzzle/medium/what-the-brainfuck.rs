use std::io;

use itertools::Itertools;
use regex::Regex;
use std::collections::HashMap;

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
    let l = parse_input!(inputs[0], i32);
    let s = parse_input!(inputs[1], i32);
    let n = parse_input!(inputs[2], i32);
    let mut rs: Vec<String> = Vec::new();
    for i in 0..l as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let r = input_line.trim_matches('\n').to_string();
        rs.push(r);
    }
    let mut cs: Vec<i32> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let c = parse_input!(input_line, i32);
        cs.push(c);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let program: String = rs.join("");

    let result: String = BrainFack::exec(program, s as usize, cs);

    // println!("answer");
    println!("{result}");
}

struct BrainFack {
}

impl BrainFack {
    fn exec(arg_program: String, vec_size: usize, arg_inputs: Vec<i32>) -> String {
        let program: String = Regex::new(r"[><+-.,\[\]]").unwrap().find_iter(&arg_program).map(|m| m.as_str()).join("");
        let mut vec: Vec<i32> = vec![0; vec_size];
        let mut inputs: Vec<i32> = arg_inputs.to_vec();

        let mut pointer: i32 = 0;
        let mut output: String = "".to_string();

        let result_jump_index_pairs: Result<HashMap<usize, usize>, String> = BrainFack::get_jump_index_pairs(program.to_string());
        if result_jump_index_pairs.is_err() {
            return result_jump_index_pairs.unwrap_err();
        }
        let jump_index_pairs: HashMap<usize, usize> = result_jump_index_pairs.unwrap();

        let mut carriage: usize = 0;
        while carriage < program.len() {
            if program.chars().nth(carriage) == Some('>') {
                pointer += 1;
            } else if program.chars().nth(carriage) == Some('<') {
                pointer -= 1;
            } else if program.chars().nth(carriage) == Some('+') {
                vec[pointer as usize] += 1;
            } else if program.chars().nth(carriage) == Some('-') {
                vec[pointer as usize] -= 1;
            } else if program.chars().nth(carriage) == Some('.') {
                output += &(vec[pointer as usize] as u8 as char).to_string();
            } else if program.chars().nth(carriage) == Some(',') {
                vec[pointer as usize] = inputs.remove(0);
            } else if program.chars().nth(carriage) == Some('[') && vec[pointer as usize] == 0 {
                carriage = jump_index_pairs[&carriage];
            } else if program.chars().nth(carriage) == Some(']') && vec[pointer as usize] != 0 {
                carriage = jump_index_pairs[&carriage];
            }

            if pointer < 0 || vec.len() <= pointer as usize {
                return "POINTER OUT OF BOUNDS".to_string();
            }

            if vec[pointer as usize] < 0 || 255 < vec[pointer as usize] {
                return "INCORRECT VALUE".to_string();
            }

            carriage += 1;
        }

        return output;
    }

    fn get_jump_index_pairs(program: String) -> Result<HashMap<usize, usize>, String> {
        let mut jump_index_pairs: HashMap<usize, usize> = HashMap::new();
        let mut jump_index_pair_stack: Vec<usize> = Vec::new();

        for (index, command) in program.chars().enumerate() {
            match command {
                '[' => {
                    jump_index_pair_stack.push(index)
                },
                ']' => {
                    if jump_index_pair_stack.is_empty() {
                        return Err("SYNTAX ERROR".to_string());
                    }

                    let pair_index: usize = jump_index_pair_stack.pop().unwrap();

                    jump_index_pairs.insert(pair_index, index);
                    jump_index_pairs.insert(index, pair_index);
                },
                _ => ()
            }
        }

        if !jump_index_pair_stack.is_empty() {
            return Err("SYNTAX ERROR".to_string());
        }

        return Ok(jump_index_pairs);
    }
}
