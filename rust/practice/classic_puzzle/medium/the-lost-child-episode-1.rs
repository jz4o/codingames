use std::io;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut rows: Vec<String> = Vec::new();
    for i in 0..10 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<String>> = rows
        .iter()
        .map(|row| row.chars().map(|c| c.to_string()).collect())
        .collect();
    for row in grid.iter_mut() {
        row.insert(0, "#".to_string());
        row.push("#".to_string());
    }
    grid.insert(0, vec!["#".to_string();grid.first().unwrap().len()]);
    grid.push(vec!["#".to_string();grid.first().unwrap().len()]);

    let mut mother_position: Option<Position> = None;
    for (row_index, row) in grid.iter().enumerate() {
        if !row.contains(&"M".to_string()) {
            continue;
        }

        let column_index: usize = row.iter().position(|value| value == "M").unwrap();

        mother_position = Some(Position{y: row_index, x: column_index});
        grid[row_index][column_index] = ".".to_string();

        break;
    }

    let mut check_positions: Vec<Position> = vec![mother_position.unwrap()];

    let mut turn: usize = 0;
    loop {
        let mut found_flag: bool = false;

        let mut next_check_positions: Vec<Position> = Vec::new();
        for check_position in check_positions.iter() {
            let position: &String = &grid[check_position.y][check_position.x];

            if position == "C" {
                found_flag = true;
                break;
            }

            if position != "." {
                continue;
            }

            grid[check_position.y][check_position.x] = turn.to_string();
            next_check_positions.push(Position{y: check_position.y - 1, x: check_position.x});
            next_check_positions.push(Position{y: check_position.y, x: check_position.x - 1});
            next_check_positions.push(Position{y: check_position.y, x: check_position.x + 1});
            next_check_positions.push(Position{y: check_position.y + 1, x: check_position.x});
        }

        if found_flag {
            break;
        }

        check_positions = next_check_positions;

        turn += 1;
    }

    let result: String = format!("{}km", turn * 10);

    // println!("shortest distance in km");
    println!("{result}");
}

struct Position {
    y: usize,
    x: usize
}
