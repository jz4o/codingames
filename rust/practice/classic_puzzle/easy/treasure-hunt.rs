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
    let h = parse_input!(inputs[0], i32);
    let w = parse_input!(inputs[1], i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const YOUR_POSITION: &str = "X";
    const WALL: &str = "#";

    rows = rows.iter().map(|row| format!("{WALL}{row}{WALL}")).collect::<Vec<String>>();
    let wall_row: String = WALL.repeat(rows.first().unwrap().len());
    rows.insert(0, wall_row.to_string());
    rows.push(wall_row.to_string());

    let mut grid: Vec<Vec<Position>> = Vec::new();
    for (row_index, row) in rows.iter().enumerate() {
        let mut position_row: Vec<Position> = Vec::new();
        for (column_index, value) in row.chars().enumerate() {
            position_row.push(Position {y: row_index, x: column_index, value: value.to_string()});
        }

        grid.push(position_row);
    }

    let start_position = grid.iter().flatten().filter(|position| position.value == YOUR_POSITION).next().unwrap();

    let mut move_histories: Vec<Vec<&Position>> = Vec::new();
    let mut temp_histories: Vec<Vec<&Position>> = vec![vec![start_position]];
    while temp_histories.len() > 0 {
        let temp_history: Vec<&Position> = temp_histories.pop().unwrap();
        let last_position: &Position = temp_history.last().unwrap();

        let mut around_positions: Vec<&Position> = vec![
            &grid[last_position.y - 1][last_position.x],
            &grid[last_position.y][last_position.x + 1],
            &grid[last_position.y + 1][last_position.x],
            &grid[last_position.y][last_position.x - 1]
        ];

        around_positions = around_positions
            .iter()
            .filter(|&position| !temp_history.contains(position) && position.value != WALL)
            .map(|position| *position)
            .collect::<Vec<&Position>>();

        if around_positions.is_empty() {
            move_histories.push(temp_history);
            continue;
        }

        for position in around_positions.iter() {
            let mut t: Vec<&Position> = temp_history.clone();
            t.push(*position);

            temp_histories.push(t);
        }
    }

    let mut amount_of_golds: Vec<i32> = Vec::new();
    for move_history in move_histories.iter() {
        let amount_of_gold: i32 = move_history
            .iter()
            .filter(|position| "0123456789".contains(&position.value))
            .map(|position| position.value.parse::<i32>().unwrap())
            .sum::<i32>();

        amount_of_golds.push(amount_of_gold);
    }

    let result: &i32 = amount_of_golds.iter().max().unwrap();

    // println!("answer");
    println!("{result}");
}

#[derive(Debug,PartialEq)]
struct Position {
    y: usize,
    x: usize,
    value: String
}
