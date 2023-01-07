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
    let mut lines: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();
    for line in lines {
        let mut stacks: Vec<Stack> = Vec::new();

        for container in line.chars().map(|c| c as i32) {
            stacks.sort_by(|a, b| a.upper_most.partial_cmp(&b.upper_most).unwrap());

            let putable_index_option: Option<usize> = stacks.iter().position(|stack| container <= stack.upper_most);
            if putable_index_option.is_some() {
                stacks.get_mut(putable_index_option.unwrap()).unwrap().upper_most = container;
            } else {
                stacks.push(Stack{upper_most: container});
            }
        }

        results.push(stacks.len().to_string());
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Stack {
    upper_most: i32
}
