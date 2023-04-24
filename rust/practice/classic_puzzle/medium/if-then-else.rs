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

    let if_elements: Vec<&String> = lines.iter().filter(|line| ["if", "else", "endif"].contains(&line.as_str())).collect();

    let mut indent: usize = 0;
    let mut stack: Vec<IndentCombination> = Vec::new();
    for if_element in if_elements.iter().rev() {
        match if_element.as_str() {
            "if" => {
                let mut value: i64 = 1;
                while !stack.is_empty() && stack.last().unwrap().indent == indent {
                    value *= stack.pop().unwrap().combination;
                }

                value += stack.pop().unwrap().combination;

                indent -= 1;

                stack.push(IndentCombination{indent: indent, combination: value});
            },
            "else" => {
                let mut value: i64 = 1;
                while !stack.is_empty() && stack.last().unwrap().indent == indent {
                    value *= stack.pop().unwrap().combination;
                }

                stack.push(IndentCombination{indent: indent - 1, combination: value});
            },
            "endif" => {
                indent += 1;
            },
            _ => ()
        }
    }

    let mut result: i64 = 1;
    for indent_combination in stack.iter() {
        result *= indent_combination.combination;
    }

    // println!("answer");
    println!("{result}");
}

struct IndentCombination {
    indent: usize,
    combination: i64
}
