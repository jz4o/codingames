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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let b = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut free_indexes: Vec<usize> = (0..n).map(|i| i as usize).collect();

    let occupied_indexes: Vec<usize> = b
        .chars()
        .enumerate()
        .filter(|(_index, c)| *c == '!')
        .map(|(index, _c)| index)
        .collect();
    let mut go_right_indexes: Vec<usize> = occupied_indexes.to_vec();
    let mut go_left_indexes: Vec<usize> = occupied_indexes.to_vec();

    while free_indexes.len() >= 2 {
        free_indexes = free_indexes
            .iter()
            .filter(|index| !go_right_indexes.contains(&index) && !go_left_indexes.contains(&index))
            .map(|index| *index)
            .collect();

        go_right_indexes = go_right_indexes.iter().map(|index| index + 1).collect();
        go_left_indexes = go_left_indexes.iter().map(|index| index - 1).collect();
    }

    let result: String = free_indexes.first().unwrap().to_string();

    // println!("0");
    println!("{result}");
}
