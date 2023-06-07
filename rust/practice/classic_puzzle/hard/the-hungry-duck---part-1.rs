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
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut grid: Vec<Vec<i32>> = Vec::new();
    for i in 0..h as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut row: Vec<i32> = Vec::new();
        for j in inputs.split_whitespace() {
            let food = parse_input!(j, i32);
            row.push(food);
        }
        grid.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut temp_grid: Vec<Vec<i32>> = grid.to_vec();
    for height in 0..h as usize {
        for width in 0..w as usize {
            let top: i32 = if height == 0 { 0 } else { temp_grid[height - 1][width] };
            let left: i32 = if width == 0 { 0 } else { temp_grid[height][width - 1] };

            temp_grid[height][width] += [top, left].iter().max().unwrap();
        }
    }

    let result: &i32 = temp_grid.last().unwrap().last().unwrap();

    // println!("answer");
    println!("{result}");
}
