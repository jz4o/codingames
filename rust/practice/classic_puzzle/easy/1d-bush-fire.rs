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
    for i in 0..n as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let line: String = lines[i].to_string();
        let mut indexes: Vec<i32> = Vec::new();
        for (index, chr) in line.as_str().chars().enumerate() {
            if chr == 'f' {
                indexes.push(index as i32);
            }
        }

        let mut drop_count: i32 = 0;
        while indexes.len() > 0 {
            let index: i32 = indexes.remove(0);

            drop_count += 1;

            indexes.retain(|i: &i32| index + 2 < *i);
        }

        let result: i32 = drop_count;

        // println!("answer");
        println!("{result}");
    }
}
