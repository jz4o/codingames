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
    let n = parse_input!(inputs[0], i32);
    let m = parse_input!(inputs[1], i32);
    let mut ts: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let t = input_line.trim_matches('\n').to_string();
        ts.push(t);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const HEAD_VALUE: &str = "o";
    const HORIZONTAL_BODY_VALUE: &str = "-";
    const VERTICAL_BODY_VALUE: &str = "|";
    const CURVE_BODY_VALUE: &str = "*";
    const TAIL_VALUES: [&str; 4] = ["v", "<", ">", "^"];
    const SEARCH_DIRECTIONS: [&str; 4] = ["top", "right", "left", "bottom"];

    let grid: Vec<Vec<String>> = ts
        .iter()
        .map(|t| t.chars().map(|c| c.to_string()).collect())
        .collect();

    let mut tail_positions: Vec<Position> = Vec::new();
    for (row_index, row) in grid.iter().enumerate() {
        for (value_index, value) in row.iter().enumerate() {
            if !TAIL_VALUES.contains(&value.as_str()) {
                continue;
            }

            tail_positions.push(Position{y: row_index, x: value_index, v: value.to_string()});
        }
    }

    let mut snakes: Vec<Snake> = Vec::new();
    for tail_position in tail_positions.iter() {
        let direction_index: usize = TAIL_VALUES.iter().position(|tail_value| tail_value.to_string() == tail_position.v).unwrap();
        let mut search_direction: String = SEARCH_DIRECTIONS[direction_index].to_string();

        let position: &Position = tail_position;
        let mut target_y: usize = position.y;
        let mut target_x: usize = position.x;
        let mut target_v: String = position.v.to_string();

        let mut parts_size: usize = 1;
        while target_v != HEAD_VALUE {
            (target_y, target_x) = match search_direction.as_str() {
                "top" => (target_y - 1, target_x),
                "right" => (target_y, target_x + 1),
                "left" => (target_y, target_x - 1),
                "bottom" => (target_y + 1, target_x),
                _ => (0, 0) // Not Arrive
            };

            target_v = grid[target_y][target_x].to_string();

            parts_size += 1;

            if target_v != CURVE_BODY_VALUE {
                continue
            }

            if ["top", "bottom"].contains(&search_direction.as_str()) {
                let left_x: usize = if target_x == 0 { 0 } else { target_x - 1 };
                search_direction = if grid[target_y][left_x] == HORIZONTAL_BODY_VALUE {
                    "left".to_string()
                } else {
                    "right".to_string()
                };
            } else if ["right", "left"].contains(&search_direction.as_str()) {
                let top_y: usize = if target_y == 0 { 0 } else { target_y - 1 };
                search_direction = if grid[top_y][target_x] == VERTICAL_BODY_VALUE {
                    "top".to_string()
                } else {
                    "bottom".to_string()
                };
            }
        }

        snakes.push(Snake{parts_size: parts_size});
    }

    let max_size: usize = snakes.iter().map(|snake| snake.parts_size).max().unwrap();
    let max_size_count: usize = snakes.iter().filter(|snake| snake.parts_size == max_size).count();

    let results: [usize; 2] = [max_size, max_size_count];

    // println!("Answer");
    for result in results {
        println!("{result}");
    }
}

struct Position {
    y: usize,
    x: usize,
    v: String
}

struct Snake {
    parts_size: usize
}
