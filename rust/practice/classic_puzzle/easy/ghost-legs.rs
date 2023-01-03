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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<String>> = lines
        .iter()
        .map(|line| line.replace("--", "-").replace("  ", " ").chars().map(|c| c.to_string()).collect())
        .collect();
    for row in grid.iter_mut() {
        row.insert(0, " ".to_string());
    }

    let top_row: Vec<String> = grid.remove(0);
    let mut bottom_row: Vec<String> = grid.pop().unwrap();
    for row in grid.iter().rev() {
        for (column_index, chr) in row.iter().enumerate() {
            if chr == "-" {
                (bottom_row[column_index - 1], bottom_row[column_index + 1])
                    = (bottom_row[column_index + 1].to_string(), bottom_row[column_index - 1].to_string());
            }
        }
    }

    let results: Vec<String> = top_row
        .iter()
        .zip(bottom_row)
        .filter(|(top_char, _)| top_char != &&" ".to_string())
        .map(|(top_char, bottom_char)| format!("{top_char}{bottom_char}"))
        .collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
