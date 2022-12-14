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
    let mut grid: Vec<Vec<i32>> = Vec::new();
    grid.push(vec![1; w as usize + 2]);
    for i in 0..h as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut row: Vec<i32> = Vec::new();
        row.push(1);
        for j in inputs.split_whitespace() {
            let v = parse_input!(j, i32);
            row.push(v);
        }
        row.push(1);

        grid.push(row);
    }
    grid.push(vec![1; w as usize + 2]);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let (y, x): (i32, i32) = find_pirates_treasure_indexes(grid);

    let result: String = format!("{x} {y}");

    // println!("x y");
    println!("{result}");
}

fn find_pirates_treasure_indexes(grid: Vec<Vec<i32>>) -> (i32, i32) {
   for row_index in 1..grid.len() - 1 {
        let row: Vec<i32> = grid[row_index].to_vec();

        for column_index in 1..row.len() - 1 {
            let value: i32 = row[column_index];

            if grid[row_index - 1][column_index - 1..column_index + 2].contains(&0) {
                continue;
            }
            if row[column_index - 1] == 0 {
                continue;
            }
            if value != 0 {
                continue;
            }
            if row[column_index + 1] == 0 {
                continue;
            }
            if grid[row_index + 1][column_index - 1..column_index + 2].contains(&0) {
                continue;
            }

            return ((row_index as i32) - 1, (column_index as i32) - 1);
        }
    }

    return (0, 0);
}
