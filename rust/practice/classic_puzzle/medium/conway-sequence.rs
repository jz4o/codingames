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
    let r = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let l = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut sequence: Vec<i32> = vec![r];
    for _ in 1..l {
        let mut temp_sequence: Vec<i32> = sequence.to_vec();
        sequence = Vec::new();

        while !temp_sequence.is_empty() {
            let mut uniq_sequence: Vec<i32> = Vec::new();
            for t in temp_sequence.iter() {
                if !uniq_sequence.contains(t) {
                    uniq_sequence.push(*t);
                }
            }

            let first_element: i32 = *uniq_sequence.first().unwrap();
            let another_element: Option<&i32> = uniq_sequence.get(1);
            let delete_size: usize = if another_element.is_some() {
                temp_sequence.iter().position(|t| t == another_element.unwrap()).unwrap()
            } else {
                temp_sequence.len()
            };

            sequence.extend([delete_size as i32, first_element]);

            temp_sequence = temp_sequence[delete_size..].to_vec();
        }
    }

    let result: String = sequence
        .iter()
        .map(|result| result.to_string())
        .collect::<Vec<String>>()
        .join(" ");

    // println!("answer");
    println!("{result}");
}
