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
    let mut lines: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<i32>> = Vec::new();
    grid.push(vec![0; w as usize + 2]);
    for line in lines.iter() {
        let mut row: Vec<i32> = line
            .replace(".", "0")
            .replace("x", "9")
            .chars()
            .map(|i| i.to_string().parse::<i32>().unwrap())
            .collect();
        row.insert(0, 0);
        row.push(0);

        grid.push(row);
    }
    grid.push(vec![0; w as usize + 2]);

    for row_index in 1..h as usize + 1 {
        for column_index in 1..w as usize + 1 {
            if grid[row_index][column_index] != 9 {
                continue;
            }

            if grid[row_index - 1][column_index - 1] != 9 {
                grid[row_index - 1][column_index - 1] += 1;
            }
            if grid[row_index - 1][column_index] != 9 {
                grid[row_index - 1][column_index] += 1;
            }
            if grid[row_index - 1][column_index + 1] != 9 {
                grid[row_index - 1][column_index + 1] += 1;
            }
            if grid[row_index][column_index - 1] != 9 {
                grid[row_index][column_index - 1] += 1;
            }
            if grid[row_index][column_index + 1] != 9 {
                grid[row_index][column_index + 1] += 1;
            }
            if grid[row_index + 1][column_index - 1] != 9 {
                grid[row_index + 1][column_index - 1] += 1;
            }
            if grid[row_index + 1][column_index] != 9 {
                grid[row_index + 1][column_index] += 1;
            }
            if grid[row_index + 1][column_index + 1] != 9 {
                grid[row_index + 1][column_index + 1] += 1;
            }
        }
    }

    let mut results: Vec<String> = Vec::new();
    for row in grid[1..h as usize + 1].iter() {
        let result: String = row[1..w as usize + 1]
            .iter()
            .map(|value| value.to_string())
            .collect::<Vec<String>>()
            .join("")
            .replace("0", ".")
            .replace("9", ".");

        results.push(result);
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
