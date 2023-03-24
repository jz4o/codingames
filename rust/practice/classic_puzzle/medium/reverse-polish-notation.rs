use std::io;

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
    let n = parse_input!(input_line, i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut instructions: Vec<String> = Vec::new();
    for instruction in inputs.split_whitespace() {
        instructions.push(instruction.to_string());
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut calc_operation: HashMap<String, fn(i32, i32) -> i32> = HashMap::new();
    calc_operation.insert("ADD".to_string(), |l, r|  l + r);
    calc_operation.insert("SUB".to_string(), |l, r|  l - r);
    calc_operation.insert("MUL".to_string(), |l, r|  l * r);
    calc_operation.insert("DIV".to_string(), |l, r|  l / r);
    calc_operation.insert("MOD".to_string(), |l, r|  l % r);

    let zero_check_operation: Vec<String> = Vec::from(["DIV".to_string(), "MOD".to_string()]);

    let mut stack: Vec<String> = Vec::new();
    for instruction in instructions.iter() {
        match instruction.as_str() {
            "ADD" | "SUB" | "MUL" | "DIV" | "MOD" => {
                let r: Option<String> = stack.pop();
                let l: Option<String> = stack.pop();
                if l.is_none() || r.is_none() {
                    stack.push("ERROR".to_string());
                    break;
                }

                let r_number: i32 = r.unwrap().parse::<i32>().unwrap();
                let l_number: i32 = l.unwrap().parse::<i32>().unwrap();

                if zero_check_operation.contains(instruction) && r_number == 0 {
                    stack.push("ERROR".to_string());
                    break;
                }

                let calc_result: String = calc_operation[instruction](l_number, r_number).to_string();

                stack.push(calc_result);
            },
            "POP" => {
                let last: Option<String> = stack.pop();
                if last.is_none() {
                    stack.push("ERROR".to_string());
                    break;
                }
            },
            "DUP" => {
                let last: Option<String> = stack.pop();
                if last.is_none() {
                    stack.push("ERROR".to_string());
                    break;
                }

                let last_string: String = last.unwrap();
                stack.push(last_string.to_string());
                stack.push(last_string.to_string());
            },
            "SWP" => {
                let r: Option<String> = stack.pop();
                let l: Option<String> = stack.pop();
                if l.is_none() || r.is_none() {
                    stack.push("ERROR".to_string());
                    break;
                }

                stack.push(r.unwrap());
                stack.push(l.unwrap());
            },
            "ROL" => {
                let last: Option<String> = stack.pop();
                if last.is_none() {
                    stack.push("ERROR".to_string());
                    break;
                }

                let last_number: usize = last.unwrap().parse::<usize>().unwrap();
                if stack.len() < last_number {
                    stack.clear();
                    stack.push("ERROR".to_string());
                    break;
                }

                let rotate_target: String = stack.remove(stack.len() - last_number);

                stack.push(rotate_target);
            },
            _ => stack.push(instruction.to_string())
        }
    }

    let result: String = stack.join(" ");

    // println!("answer");
    println!("{result}");
}
