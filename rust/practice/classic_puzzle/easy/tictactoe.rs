use std::io;

use itertools::Itertools;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut grid: Vec<Vec<String>> = Vec::new();
    for i in 0..3 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        grid.push(line.chars().map(|c| c.to_string()).collect::<Vec<String>>());
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut is_moved: bool = false;

    // check row
    for index in 0..3 {
        if is_winning_move(grid[index].to_vec()) {
            grid[index] = vec!["O".to_string(), "O".to_string(), "O".to_string()];

            is_moved = true;
            break;
        }
    }

    // check column
    if !is_moved {
        for column_index in 0..3 {
            if is_winning_move((0..3).map(|row_index| grid[row_index][column_index].to_string()).collect_vec()) {
                for row_index in 0..3 {
                    grid[row_index][column_index] = "O".to_string();
                }

                is_moved = true;
                break;
            }
        }
    }

    // check diagonal
    if !is_moved && is_winning_move((0..3).map(|index| grid[index][index].to_string()).collect_vec()) {
        for index in 0..3 {
            grid[index][index] = "O".to_string();
        }

        is_moved = true;
    }
    if !is_moved && is_winning_move((0..3).map(|index| grid[index][2 - index].to_string()).collect_vec()) {
        for index in 0..3 {
            grid[index][2 - index] = "O".to_string();
        }

        is_moved = true;
    }

    let results: Vec<String> = if !is_moved {
        vec!["false".to_string()]
    } else {
        grid.iter().map(|row| row.join("")).collect_vec()
    };

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

fn is_winning_move(line: Vec<String>) -> bool {
    return line.iter().sorted().join("") == ".OO";
}
