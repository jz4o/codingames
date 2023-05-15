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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let count = parse_input!(input_line, i32);
    let mut rasters: Vec<String> = Vec::new();
    for i in 0..height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let raster = input_line.trim_matches('\n').to_string();
        rasters.push(raster);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<String>> = rasters
        .iter()
        .map(|raster| raster.chars().map(|c| c.to_string()).collect())
        .collect();

    for _ in 0..count {
        for row in grid.iter_mut() {
            row.sort();
        }

        grid = transpose(grid.to_vec());
        grid.reverse();
    }

    let results: Vec<String> = grid.iter().map(|row| row.join("")).collect();

    // println!("...");
    // println!("write ###");
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
