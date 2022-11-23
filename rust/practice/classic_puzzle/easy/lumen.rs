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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let l = parse_input!(input_line, i32);
    let mut cell_rows: Vec<Vec<String>> = Vec::new();
    for i in 0..n as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut cell_row: Vec<String> = Vec::new();
        for cell in inputs.split_whitespace() {
            cell_row.push(cell.to_string());
        }
        cell_rows.push(cell_row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let light_spot: String = "O".to_string();
    let dark_spot: String = "X".to_string();

    let padding_row: Vec<String> = vec![light_spot.to_string();(l * 2 + n) as usize];
    let padding_column: Vec<String> = vec![light_spot.to_string();l as usize];

    let mut grid: Vec<Vec<String>> = Vec::new();
    grid.extend((0..l).map(|_| padding_row.to_vec()).collect::<Vec<Vec<String>>>());
    for i in 0..n as usize {
        let mut row: Vec<String> = Vec::new();
        row.extend(padding_column.to_vec());
        row.extend(cell_rows[i].to_vec());
        row.extend(padding_column.to_vec());

        grid.push(row);
    }
    grid.extend((0..l).map(|_| padding_row.to_vec()).collect::<Vec<Vec<String>>>());

    let mut c_positions: Vec<Position> = Vec::new();
    for row_index in 0..grid.len() {
        let row: Vec<String> = grid[row_index].to_vec();

        for column_index in 0..row.len() {
            let value: String = row[column_index].to_string();

            if value == "C" {
                c_positions.push(Position{row_index, column_index});
            }
        }
    }

    for c_position in c_positions {
        let c_row_index: usize = c_position.row_index;
        let c_column_index: usize = c_position.column_index;

        for row_index in c_row_index - l as usize + 1..c_row_index + l as usize {
            for column_index in c_column_index - l as usize + 1..c_column_index + l as usize {
                grid[row_index][column_index] = light_spot.to_string();
            }
        }
    }

    let result: usize = grid.iter().flatten().filter(|&value| value.to_string() == dark_spot).count();

    // println!("2");
    println!("{result}");
}

struct Position {
    row_index: usize,
    column_index: usize
}
