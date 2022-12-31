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
    let n = parse_input!(input_line, i32); // the number of mountains
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut heights: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let height = parse_input!(i, i32);
        heights.push(height);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let max_height: i32 = *heights.iter().max().unwrap();

    let mut transposed_map: Vec<Vec<String>> = Vec::new();
    for height in heights {
        for h in 0..height {
            let left_space: String = " ".repeat((max_height - h - 1) as usize);
            let right_space: String = " ".repeat(h as usize);
            transposed_map.push(format!("{left_space}/{right_space}").chars().map(|c| c.to_string()).collect());
        }

        for h in 0..height {
            let left_space: String = " ".repeat((max_height - height + h) as usize);
            let right_space: String = " ".repeat((height - h - 1) as usize);
            transposed_map.push(format!("{left_space}\\{right_space}").chars().map(|c| c.to_string()).collect());
        }
    }

    let mountain_map: Vec<Vec<String>> = transpose(transposed_map);

    let results: Vec<String> = mountain_map.iter().map(|mountain_row| mountain_row.join("").trim_end().to_string()).collect();

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
