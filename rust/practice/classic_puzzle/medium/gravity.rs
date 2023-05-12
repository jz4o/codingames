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
    let width = parse_input!(inputs[0], i32);
    let height = parse_input!(inputs[1], i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim().to_string();

        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<char>> = lines
        .iter()
        .map(|line| line.chars().collect())
        .collect();

    grid = transpose(grid);
    for row in grid.iter_mut() {
        row.sort();
        row.reverse();
    }

    let results: Vec<String> = transpose(grid)
        .iter()
        .map(|row| row.iter().map(|c| c.to_string()).collect::<Vec<String>>().join(""))
        .collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

fn transpose(grid: Vec<Vec<char>>) -> Vec<Vec<char>> {
    let grid_column_size: usize = grid.first().unwrap().len();

    let mut results: Vec<Vec<char>> = vec![Vec::new();grid_column_size];

    for column_index in 0..grid_column_size {
        for row in grid.iter() {
            results.get_mut(column_index).unwrap().push(row[column_index]);
        }
    }

    return results;
}
