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
    let mut rows: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }
    // for i in 0..h as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        // println!("answer");
    // }

    const REPLACEABLE_CHARS: [&str; 2] = ["S", "."];
    const BASE_NUM: i32 = 36;

    let mut grid: Vec<Vec<String>> = rows.iter().map(|row| row.chars().map(|c| c.to_string()).collect()).collect();

    let mut arive_positions: Vec<Position> = Vec::new();
    for (row_index, row) in grid.iter().enumerate() {
        if !row.contains(&"S".to_string()) {
            continue;
        }

        let column_index: usize = row.iter().position(|value| value == "S").unwrap();
        arive_positions.push(Position{y: row_index, x: column_index});

        break;
    }

    let mut step: i32 = 0;
    while !arive_positions.is_empty() {
        let mut temp_arive_positions: Vec<Position> = Vec::new();

        for position in arive_positions.iter() {
            if REPLACEABLE_CHARS.contains(&grid[position.y][position.x].as_str()) {
                grid[position.y][position.x] = to_nbase_str(step, BASE_NUM).to_uppercase();
            }

            let around_positions: [Position; 4] = [
                Position{y: if position.y == 0 { h as usize - 1 } else { position.y - 1}, x: position.x},
                Position{y: position.y, x: if position.x == 0 { w as usize - 1 } else { position.x - 1}},
                Position{y: position.y, x: (position.x + 1) % w as usize},
                Position{y: (position.y + 1) % h as usize, x: position.x}
            ];

            for around_position in around_positions {
                if grid[around_position.y][around_position.x] == "." {
                    temp_arive_positions.push(around_position);
                }
            }
        }

        arive_positions = temp_arive_positions;
        step += 1;
    }

    let results: Vec<String> = grid.iter().map(|row| row.join("")).collect();

    for result in results {
        println!("{result}");
    }
}

struct Position {
    y: usize,
    x: usize
}

fn to_nbase_str(digit: i32, base: i32) -> String {
    let mut result: String = "".to_string();

    let mut d: i32 = digit;
    while d > 0 {
        let mod_num: u32 = (d % base) as u32;

        result = std::char::from_digit(mod_num, base as u32).unwrap().to_string() + &result;
        d = d / base;
    }

    if result.len() == 0 {
        result = "0".to_string();
    }

    return result;
}
