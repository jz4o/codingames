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
    let m = parse_input!(inputs[0], i32);
    let n = parse_input!(inputs[1], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let t = parse_input!(input_line, i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut choices: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let choice = parse_input!(i, i32);
        choices.push(choice);
    }
    let mut grid: Vec<Vec<i32>> = (0..n).map(|_| vec![0; m as usize]).collect();
    for row_index in 0..(n as usize) {
        grid[row_index][0] += 1;
        grid[row_index][m as usize - 1] += 1;
    }
    for column_index in 0..(m as usize) {
        grid[0][column_index] += 1;
        grid[n as usize - 1][column_index] += 1;
    }
    for i in 0..t as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let choice: i32 = choices[i];
        let choice_index: usize = choice as usize - 1;

        grid[choice_index].pop();
        let eat_index: usize = grid[choice_index].len();

        if eat_index != 0 {
            grid[choice_index][eat_index - 1] += 1;
        }
        if choice_index != 0 && eat_index < grid[choice_index - 1].len() {
            grid[choice_index - 1][eat_index] += 1;
        }
        if choice_index + 1 != m as usize && eat_index < grid[choice_index + 1].len() {
            grid[choice_index + 1][eat_index] += 1;
        }

        let result: String = grid.iter().flatten().sum::<i32>().to_string();

        // println!("perimeter");
        println!("{result}");
    }
}
