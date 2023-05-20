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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let r = parse_input!(inputs[0], i32);
    let c = parse_input!(inputs[1], i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..r as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let digit_grid: Vec<Vec<i32>> = rows
        .iter()
        .map(|row|
            row.split_whitespace().map(|i| i.to_string().parse::<i32>().unwrap()).collect()
        )
        .collect();

    let mut digits: Vec<i32> = Vec::new();
    digits.extend(digit_grid.iter().flatten());
    for row in digit_grid.iter() {
        digits.extend(combination_digits(row.to_vec()));
    }
    for row in transpose(digit_grid) {
        digits.extend(combination_digits(row.to_vec()));
    }

    let result: usize = digits
        .iter()
        .unique()
        .filter(|&&digit| is_prime(digit))
        .count();

    // println!("answer");
    println!("{result}");
}

fn transpose(grid: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
    let grid_column_size: usize = grid.first().unwrap().len();

    let mut results: Vec<Vec<i32>> = vec![Vec::new();grid_column_size];
    for column_index in 0..grid_column_size {
        for row in grid.iter() {
            results.get_mut(column_index).unwrap().push(row[column_index]);
        }
    }

    return results;
}

fn combination_digits(row: Vec<i32>) -> Vec<i32> {
    let mut result: Vec<i32> = Vec::new();
    for size in 2..row.len() + 1 {
        for index in 0..row.len() - size + 1 {
            let digit: i32 = row[index..index + size]
                .iter()
                .map(|i| i.to_string())
                .join("")
                .parse::<i32>()
                .unwrap();

            result.push(digit);
        }
    }

    return result;
}

fn is_prime(number: i32) -> bool {
    if number <= 1 {
        return false;
    }

    for i in 2..number {
        if number % i == 0 {
            return false;
        }
    }

    return true;
}
