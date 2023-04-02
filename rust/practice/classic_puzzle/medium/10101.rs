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
    let w = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let h = parse_input!(input_line, i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let grid: Vec<Vec<String>> = rows.iter().map(|row| row.chars().map(|c| c.to_string()).collect()).collect();

    let mut scores: Vec<usize> = Vec::new();
    scores.push(get_completed_row_or_column_count(grid.to_vec()));

    for row_index in 0..h as usize - 1 {
        for column_index in 0..w as usize - 1 {
            // check block can placed?
            if grid[row_index][column_index] != "." {
                continue;
            }
            if grid[row_index][column_index + 1] != "." {
                continue;
            }
            if grid[row_index + 1][column_index] != "." {
                continue;
            }
            if grid[row_index + 1][column_index + 1] != "." {
                continue;
            }

            // grid with block placed.
            let mut copy_grid: Vec<Vec<String>> = grid.to_vec();
            copy_grid.get_mut(row_index).unwrap()[column_index] = "#".to_string();
            copy_grid.get_mut(row_index).unwrap()[column_index + 1] = "#".to_string();
            copy_grid.get_mut(row_index + 1).unwrap()[column_index] = "#".to_string();
            copy_grid.get_mut(row_index + 1).unwrap()[column_index + 1] = "#".to_string();

            // count columns and rows that could be completed.
            scores.push(get_completed_row_or_column_count(copy_grid.to_vec()));
        }
    }

    let result: String = scores.iter().max().unwrap().to_string();

    // println!("answer");
    println!("{result}");
}

fn get_completed_row_or_column_count(grid: Vec<Vec<String>>) -> usize {
    let mut rows: Vec<Vec<String>> = Vec::new();
    rows.extend(grid.to_vec());
    rows.extend(transpose(grid.to_vec()));

    return rows
        .iter()
        .filter(|row| row.iter().all(|value| value == "#"))
        .count();
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
