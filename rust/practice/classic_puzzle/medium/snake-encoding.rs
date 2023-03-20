use std::io;

use itertools::Itertools;
use regex::Regex;

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
    let x = parse_input!(input_line, i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim().to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    // array to strign
    let grid: Vec<Vec<String>> = lines
        .iter()
        .map(|line| line.chars().map(|c| c.to_string()).collect())
        .collect();
    let transposed_grid: Vec<Vec<String>> = transpose(grid);
    let mut snake_string: String = transposed_grid
        .iter()
        .enumerate()
        .map(|(index, row)|
            if index % 2 == 0 {
                row.iter().rev().join("")
            } else {
                row.join("")
            }
        )
        .join("");

    // rotate char(s)
    let begin_index: usize = (n.pow(2) - x) as usize;
    let end_index: usize = begin_index + snake_string.len();
    snake_string = snake_string.repeat(2)[begin_index..end_index].to_string();

    // string to array
    let rotated_transpose_grid: Vec<Vec<String>> = Regex::new(&format!(".{{{n}}}"))
        .unwrap()
        .find_iter(&snake_string)
        .map(|m| m.as_str())
        .enumerate()
        .map(|(index, m)|
            if index % 2 == 0 {
                m.chars().rev().map(|c| c.to_string()).collect::<Vec<String>>()
            } else {
                m.chars().map(|c| c.to_string()).collect::<Vec<String>>()
            }
        )
        .collect();
    let rotated_grid: Vec<Vec<String>> = transpose(rotated_transpose_grid);

    let results: Vec<String> = rotated_grid.iter().map(|row| row.join("")).collect();

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
