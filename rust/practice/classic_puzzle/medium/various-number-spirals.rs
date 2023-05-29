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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let vert_pos = inputs[0].trim().to_string();
    let hor_pos = inputs[1].trim().to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let order = inputs[0].trim().to_string();
    let direction = inputs[1].trim().to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let number_spiral: Vec<Vec<i32>> = NumberSpiral::create(n, vert_pos, hor_pos, order, direction);

    let results: Vec<String> = number_spiral
        .iter()
        .map(|row| row.iter().map(|v| v.to_string()).collect::<Vec<String>>().join("\t"))
        .collect();

    // println!("spiral");
    for result in results {
        println!("{result}");
    }
}

struct NumberSpiral {
}

impl NumberSpiral {
    fn create(size: i32, vert_pos: String, hor_pos: String, order: String, direction: String) -> Vec<Vec<i32>> {
        let mut number_spiral: Vec<Vec<i32>> = NumberSpiral::create_fixed_number_spiral(size);

        // starting point
        let counter_clock_count: usize = ["br", "tr", "tl", "bl"]
            .iter()
            .position(|point| point.to_string() == format!("{vert_pos}{hor_pos}"))
            .unwrap();
        for _ in 0..counter_clock_count {
            number_spiral = NumberSpiral::counter_clock(number_spiral);
        }

        // direction
        if direction == "cc" {
            number_spiral = NumberSpiral::reverse_direction(number_spiral);
        }

        // order
        if order == "+" {
            number_spiral = NumberSpiral::reverse_order(number_spiral);
        }

        return number_spiral;
    }

    // create spiral by below condition
    //
    // conditions:
    //
    //   size: #{size}
    //   vert_pos: b
    //   hor_pos: r
    //   order: -
    //   direction: c
    //
    // exapmles:
    //
    //   5 4 3
    //   6 1 2
    //   7 8 9
    //
    //   10  9  8  7
    //   11  2  1  6
    //   12  3  4  5
    //   13 14 15 16
    fn create_fixed_number_spiral(size: i32) -> Vec<Vec<i32>> {
        let mut top_rows: Vec<Vec<i32>> = Vec::new();
        let mut bottom_rows: Vec<Vec<i32>> = Vec::new();

        for i in (1..(size / 2 * 2 + 2)).step_by(2) {
            let top_row_right_value: i32 = i.pow(2) + i + 2;
            let top_row_left_value: i32 = top_row_right_value + i - 1;
            let mut top_row: Vec<i32> = (top_row_right_value..top_row_left_value + 1).rev().collect_vec();

            let bottom_row_right_value: i32 = i.pow(2);
            let bottom_row_left_value: i32 = bottom_row_right_value - i + 1;
            let mut bottom_row: Vec<i32> = (bottom_row_left_value..bottom_row_right_value + 1).collect_vec();

            for j in 1..(((size / 2 * 2 + 1) - i) / 2) + 1 {
                let inner_square_last_value: i32 = (i + (j - 1) * 2).pow(2);
                let outer_square_last_value: i32 = (i + (j * 2)).pow(2);

                let bottom_row_left_value: i32 = outer_square_last_value - i - j * 3 + 1;
                let bottom_row_right_value: i32 = inner_square_last_value + j;

                let top_row_left_value = bottom_row_left_value - i;
                let top_row_right_value: i32 = bottom_row_right_value + i;

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

        let mut number_spiral: Vec<Vec<i32>> = [top_rows, bottom_rows].concat();

        if size % 2 == 0 {
            number_spiral.pop();
            number_spiral = number_spiral.iter().map(|row| row[1..].to_vec()).collect();

            for _ in 0..2 {
                number_spiral = NumberSpiral::counter_clock(number_spiral);
            }
        }

        return number_spiral;
    }

    fn counter_clock(number_spiral: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut results: Vec<Vec<i32>> = number_spiral.to_vec();
        results = transpose(number_spiral);
        results.reverse();

        return results;
    }

    fn reverse_order(number_spiral: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let spiral_size: usize = number_spiral.len();

        let numbers: Vec<&i32> = number_spiral.iter().flatten().collect_vec();
        let sum_number: i32 = **numbers.iter().min().unwrap() + **numbers.iter().max().unwrap();

        let diff_numbers: Vec<i32> = numbers.iter().map(|&&number| sum_number - number).collect();

        return (0..spiral_size)
            .map(|i| diff_numbers[i * spiral_size..(i + 1) * spiral_size].to_vec())
            .collect();
    }

    fn reverse_direction(number_spiral: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let numbers: Vec<&i32> = number_spiral.iter().flatten().collect_vec();
        let is_start_tl_or_br: bool = [numbers.first().unwrap(), numbers.last().unwrap()].contains(&numbers.iter().max().unwrap());

        return if is_start_tl_or_br {
            transpose(number_spiral)
        } else {
            let mut results: Vec<Vec<i32>> = number_spiral.to_vec();
            results.reverse();
            results = transpose(results);
            results.reverse();

            results
        };
    }
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
