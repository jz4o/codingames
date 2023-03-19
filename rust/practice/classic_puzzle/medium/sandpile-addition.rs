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
    let n = parse_input!(input_line, i32);
    let mut first_sandpile_rows: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        first_sandpile_rows.push(row);
    }
    let mut second_sandpile_rows: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        second_sandpile_rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<i32>> = Vec::new();
    for row_index in 0..n as usize {
        let mut row: Vec<i32> = Vec::new();
        for column_index in 0..n as usize {
            let first_sandpile_value: i32 = first_sandpile_rows[row_index].chars().nth(column_index).unwrap().to_string().parse::<i32>().unwrap();
            let second_sandpile_value: i32 = second_sandpile_rows[row_index].chars().nth(column_index).unwrap().to_string().parse::<i32>().unwrap();

            row.push(first_sandpile_value + second_sandpile_value);
        }

        grid.push(row);
    }

    const BORDER: i32 = 4;

    let mut be_check: bool = true;
    while be_check {
        be_check = false;

        for row_index in 0..n as usize {
            for column_index in 0..n as usize {
                if grid[row_index][column_index] < BORDER {
                    continue;
                }

                be_check = true;

                grid[row_index][column_index] -= BORDER;
                if row_index > 0 {
                    grid[row_index - 1][column_index] += 1;
                }
                if row_index < n as usize - 1 {
                    grid[row_index + 1][column_index] += 1;
                }
                if column_index > 0 {
                    grid[row_index][column_index - 1] += 1;
                }
                if column_index < n as usize - 1 {
                    grid[row_index][column_index + 1] += 1;
                }
            }
        }
    }

    let results: Vec<String> = grid
        .iter()
        .map(|row| row.iter().map(|value| value.to_string()).collect::<Vec<String>>().join(""))
        .collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
