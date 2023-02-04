use std::io;

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
    let size = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let angle = parse_input!(input_line, i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..size as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<String>> = lines.iter().map(|line| line.split_whitespace().map(|s| s.to_string()).collect()).collect();

    let diagonal_size: usize = size as usize * 2 - 1;

    let rotate_count: i32 = ((angle - 45) % 360) / 90;
    for _ in 0..rotate_count {
        grid = transpose(grid.to_vec());
        grid.reverse();
    }

    let mut diamond_grid: Vec<Vec<String>> = Vec::new();
    for time in 1..diagonal_size as i32 + 1 {
        let start: i32 = std::cmp::max(0, time - size);
        let count: i32 = std::cmp::min(time, size * 2 - time);

        diamond_grid.push(vec![]);

        let diamond_grid_len: usize = diamond_grid.len();
        for c in 0..count {
            let grid_value: String = grid.get_mut((start + c) as usize).unwrap().pop().unwrap();
            diamond_grid.get_mut(diamond_grid_len - 1).unwrap().push(grid_value);
        }
    }

    let results: Vec<String> = diamond_grid
        .iter()
        .map(|row| center(row.join(" "), diagonal_size))
        .collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

fn transpose(grid: Vec<Vec<String>>) -> Vec<Vec<String>> {
    let grid_column_size: usize = grid.first().unwrap().len();

    let mut results: Vec<Vec<String>> = vec![Vec::new();grid_column_size];

    for column_index in 0..grid_column_size {
        for row in grid.iter() {
            results.get_mut(column_index).unwrap().push(row[column_index].to_string());
        }
    }

    return results;
}

fn center(value: String, length: usize) -> String {
    if length <= value.len() {
        return value;
    }

    let space_length = length - value.len();
    let left_space: String = " ".repeat(space_length / 2);
    let right_space: String = " ".repeat(space_length - left_space.len());

    return format!("{left_space}{value}{right_space}");
}
