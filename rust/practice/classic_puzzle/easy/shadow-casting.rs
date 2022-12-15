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

    let width: usize = lines.iter().map(|line| line.len()).max().unwrap() + 2;
    let mut grid: Vec<Vec<String>> = Vec::new();
    for line in lines {
        let mut row: Vec<String> = line.chars().map(|c| c.to_string()).collect();
        row.extend(vec![" ".to_string();width - row.len()]);

        grid.push(row);
    }
    grid.push(vec![" ".to_string();width]);
    grid.push(vec![" ".to_string();width]);

    for row_index in (0..n as usize + 2).rev() {
        for column_index in (0..width).rev() {
            if grid[row_index][column_index] != " " {
                continue;
            }

            if row_index >= 2 && column_index >= 2 && grid[row_index - 2][column_index - 2] != " " {
                grid[row_index][column_index] = "`".to_string();
            }

            if row_index >= 1 && column_index >= 1 && grid[row_index - 1][column_index - 1] != " " {
                grid[row_index][column_index] = "-".to_string();
            }
        }
    }

    let results: Vec<String> = grid.iter().map(|row| row.join("").trim_end().to_string()).collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
