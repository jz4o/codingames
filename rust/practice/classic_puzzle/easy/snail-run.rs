use std::io;

use regex::Regex;

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
    let number_snails = parse_input!(input_line, i32);
    let mut speed_snails: Vec<i32> = Vec::new();
    for i in 0..number_snails as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let speed_snail = parse_input!(input_line, i32);
        speed_snails.push(speed_snail);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let map_height = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let map_width = parse_input!(input_line, i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..map_height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut snails: Vec<Snail> = Vec::new();
    let mut goal_positions: Vec<Position> = Vec::new();

    for (row_index, row) in rows.iter().enumerate() {
        for (value_index, value) in row.chars().map(|c| c.to_string()).enumerate() {
            let position: Position = Position{y: row_index, x: value_index};

            if Regex::new(r"\d").unwrap().is_match(&value) {
                let v: i32 = value.parse().unwrap();
                snails.push(Snail{number: v, speed: speed_snails[v as usize - 1], position: position, goal_time: -1.0});
            } else if value == "#" {
                goal_positions.push(position);
            }
        }
    }

    for snail in snails.iter_mut() {
        if snail.speed == 0 {
            continue;
        }

        let distance: f32 = goal_positions
            .iter()
            .map(|goal| goal.y.abs_diff(snail.position.y) + goal.x.abs_diff(snail.position.x))
            .min()
            .unwrap()
            as f32;

        snail.goal_time = distance / snail.speed as f32;
    }

    let mut goaled_snails: Vec<&Snail> = snails.iter().filter(|snail| snail.goal_time >= 0.0).collect();
    goaled_snails.sort_by(|a, b| a.goal_time.partial_cmp(&b.goal_time).unwrap());

    let winner = goaled_snails.first().unwrap();

    let result: String = winner.number.to_string();

    // println!("winner is number");
    println!("{result}");
}

struct Position {
    y: usize,
    x: usize
}

struct Snail {
    number: i32,
    speed: i32,
    position: Position,
    goal_time: f32
}
