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
    let n = parse_input!(input_line, i32);
    let mut top_rows: Vec<Vec<i32>> = Vec::new();
    let mut bottom_rows: Vec<Vec<i32>> = Vec::new();
    for i in (1..n + 1).step_by(2) {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let mut top_row_right_value: i32 = i.pow(2) + i + 2;
        let mut top_row_left_value: i32 = top_row_right_value + i - 1;
        let mut top_row: Vec<i32> = (top_row_right_value..top_row_left_value + 1).rev().collect();

        let mut bottom_row_right_value: i32 = i.pow(2);
        let mut bottom_row_left_value: i32 = bottom_row_right_value - i + 1;
        let mut bottom_row: Vec<i32> = (bottom_row_left_value..bottom_row_right_value + 1).collect();

        for j in 1..(n - i) / 2 + 1 {
            let inner_square_last_value: i32 = (i + (j - 1) * 2).pow(2);
            let outer_square_last_value: i32 = (i + (j * 2)).pow(2);

            bottom_row_left_value = outer_square_last_value - i - j * 3 + 1;
            bottom_row_right_value = inner_square_last_value + j;

            top_row_left_value = bottom_row_left_value - i;
            top_row_right_value = bottom_row_right_value + i;

            top_row.push(top_row_right_value);
            top_row.insert(0, top_row_left_value);

            bottom_row.push(bottom_row_right_value);
            bottom_row.insert(0, bottom_row_left_value);
        }

        top_rows.insert(0, top_row);
        bottom_rows.push(bottom_row);
    }

    // remove trash row
    top_rows.remove(0);

    let mut number_grid: Vec<Vec<i32>> = Vec::new();
    number_grid.extend(top_rows);
    number_grid.extend(bottom_rows);

    let mut results: Vec<String> = Vec::new();
    for number_row in number_grid {
        let result_number_row: String = number_row
            .iter()
            .map(|&num| if is_prime(num) {"#"} else {" "})
            .join(" ");
        results.push(result_number_row);
    }

    // println!("ROW");
    for result in results {
        println!("{result}");
    }
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
