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
    let mut grid: Vec<Vec<i32>> = Vec::new();
    for i in 0..height as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut row: Vec<i32> = Vec::new();
        for j in inputs.split_whitespace() {
            let cell = parse_input!(j, i32);
            row.push(cell);
        }
        grid.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut rectangle_sizes: Vec<usize> = Vec::new();
    for (row_index, row) in grid.iter().enumerate() {
        for (cell_index, cell) in row.iter().enumerate() {
            if cell != &1 {
                continue;
            }

            for h in 1..height as usize - row_index + 1 {
                let h_rows: Vec<Vec<i32>> = grid[row_index..row_index + h].to_vec();

                for w in 1..width as usize - cell_index + 1 {
                    let binary_rows: Vec<Vec<i32>> = h_rows.iter().map(|h_row| h_row[cell_index..cell_index + w].to_vec()).collect();
                    if binary_rows.iter().all(|binary_row| !binary_row.contains(&0)) {
                        let rectangle_size: usize = binary_rows.iter().map(|binary_row| binary_row.len()).sum();
                        rectangle_sizes.push(rectangle_size);
                    }
                }
            }
        }
    }

    let result: String = rectangle_sizes.iter().max().unwrap().to_string();

    // println!("answer");
    println!("{result}");
}
