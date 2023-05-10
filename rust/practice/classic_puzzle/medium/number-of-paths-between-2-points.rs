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
    let m = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..m as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<i32>> = Vec::new();
    grid.push(vec![1; n as usize + 1]);
    for row in rows.iter() {
        let mut grid_row: Vec<i32> = Vec::new();
        grid_row.push(1);
        grid_row.extend(row.chars().map(|c| c.to_string().parse::<i32>().unwrap()).collect::<Vec<i32>>());

        grid.push(grid_row);
    }

    let mut path_grid: Vec<Vec<i32>> = (0..m + 1).map(|_| vec![0; n as usize + 1]).collect();

    grid[1][1] = 1;
    path_grid[1][1] = 1;

    for row_index in 1..m as usize + 1 {
        for column_index in 1..n as usize + 1 {
            if grid[row_index][column_index] != 0 {
                continue;
            }

            let top_math_paths: i32 = path_grid[row_index - 1][column_index];
            let left_math_paths: i32 = path_grid[row_index][column_index - 1];
            path_grid[row_index][column_index] = top_math_paths + left_math_paths;
        }
    }

    let result: i32 = path_grid[m as usize][n as usize];

    // println!("answer");
    println!("{result}");
}
