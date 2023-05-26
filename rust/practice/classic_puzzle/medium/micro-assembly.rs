use std::io;

use std::collections::HashMap;

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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let a = parse_input!(inputs[0], i32);
    let b = parse_input!(inputs[1], i32);
    let c = parse_input!(inputs[2], i32);
    let d = parse_input!(inputs[3], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut instructions: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let instruction = input_line.trim_matches('\n').to_string();
        instructions.push(instruction);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut register: HashMap<String, i32> = HashMap::from([
        ("a".to_string(), a),
        ("b".to_string(), b),
        ("c".to_string(), c),
        ("d".to_string(), d)
    ]);

    let mut index: usize = 0;
    while index < instructions.len() {
        let instruction_elements: Vec<&str> = instructions[index].split_whitespace().collect();
        let operator: String = instruction_elements[0].to_string();
        let arg_0: String = instruction_elements[1].to_string();
        let arg_1_element: String = instruction_elements[2].to_string();
        let arg_1: i32 = if register.contains_key(&arg_1_element) {register[&arg_1_element]} else {arg_1_element.parse::<i32>().unwrap()};
        let mut arg_2: Option<i32> = None;
        if 4 <= instruction_elements.len() {
            let arg_2_element: String = instruction_elements[3].to_string();
            arg_2 = if register.contains_key(&arg_2_element) {Some(register[&arg_2_element])} else {Some(arg_2_element.parse::<i32>().unwrap())};
        }

        match operator.as_str() {
            "MOV" => {
                register.insert(arg_0, arg_1);
            },
            "ADD" => {
                register.insert(arg_0, arg_1 + arg_2.unwrap());
            },
            "SUB" => {
                register.insert(arg_0, arg_1 - arg_2.unwrap());
            },
            "JNE" => {
                if arg_1 != arg_2.unwrap() {
                    index = arg_0.parse::<usize>().unwrap();
                    continue;
                }
            },
            _ => ()
        }

        index += 1;
    }

    let result: String = "abcd".chars().map(|r| register[&r.to_string()]).join(" ");

    // println!("a b c d");
    println!("{result}");
}
