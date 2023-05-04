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
    let mut grid: Vec<Vec<i32>> = Vec::new();
    for i in 0..n as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut row: Vec<i32> = Vec::new();
        for j in inputs.split_whitespace() {
            let c = parse_input!(j, i32);
            row.push(c);
        }
        grid.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let check_all_sum: bool = grid.iter().flatten().sum::<i32>() == (1..n.pow(2) + 1).sum();

    let mut line_sums: Vec<i32> = Vec::new();
    line_sums.extend(grid.iter().map(|row| row.iter().sum::<i32>()));
    line_sums.extend(transpose(grid.to_vec()).iter().map(|row| row.iter().sum::<i32>()));
    line_sums.push(grid.iter().enumerate().map(|(index, row)| row[index]).sum());
    line_sums.push(grid.iter().enumerate().map(|(index, row)| row[row.len() - index - 1]).sum());

    let first_line_sum: &i32 = line_sums.first().unwrap();
    let check_all_line_sum: bool = line_sums.iter().all(|line_sum| line_sum == first_line_sum);

    let result: &str = if check_all_sum && check_all_line_sum {
        "MAGIC"
    } else {
        "MUGGLE"
    };

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
