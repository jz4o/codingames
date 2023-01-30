use std::io;

use std::collections::HashSet;

use itertools::Itertools;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut grid: Vec<Vec<i32>> = Vec::new();
    for i in 0..9 as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut row: Vec<i32> = Vec::new();
        for j in inputs.split_whitespace() {
            let n = parse_input!(j, i32);
            row.push(n);
        }
        grid.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut line_number_counts: Vec<usize> = Vec::new();

    for row in grid.iter() {
        line_number_counts.push(row.iter().collect::<HashSet<&i32>>().len());
    }
    for row in transpose(grid.iter().collect_vec()) {
        line_number_counts.push(row.iter().collect::<HashSet<&i32>>().len());
    }

    let mut sub_grids: Vec<Vec<i32>> = vec![vec![];9];
    for row_index in 0..9 {
        for column_index in 0..9 {
            let sub_grid_index: usize = (row_index / 3 * 3) + (column_index / 3);
            sub_grids.get_mut(sub_grid_index).unwrap().push(grid[row_index][column_index]);
        }
    }
    for sub_grid in sub_grids.iter() {
        line_number_counts.push(sub_grid.iter().collect::<HashSet<&i32>>().len());
    }

    let result: String = line_number_counts.iter().all(|&number_count| number_count == 9).to_string();

    // println!("true or false");
    println!("{result}");
}

fn transpose(grid: Vec<&Vec<i32>>) -> Vec<Vec<i32>> {
    let grid_column_size: usize = grid.first().unwrap().len();

    let mut results: Vec<Vec<i32>> = vec![Vec::new();grid_column_size];

    for column_index in 0..grid_column_size {
        for row in grid.iter() {
            results.get_mut(column_index).unwrap().push(row[column_index]);
        }
    }

    return results;
}
