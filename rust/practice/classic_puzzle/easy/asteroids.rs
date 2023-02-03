use std::io;

use std::collections::HashMap;

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
    let t1 = parse_input!(inputs[2], i32);
    let t2 = parse_input!(inputs[3], i32);
    let t3 = parse_input!(inputs[4], i32);
    let mut first_picture_rows: Vec<String> = Vec::new();
    let mut second_picture_rows: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let first_picture_row = inputs[0].trim().to_string();
        let second_picture_row = inputs[1].trim().to_string();

        first_picture_rows.push(first_picture_row);
        second_picture_rows.push(second_picture_row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut marks: Vec<char> = first_picture_rows.join("").replace(".", "").chars().collect();

    let mut position_hash: HashMap<char, HashMap<&str, Position>> = HashMap::new();
    for mark in marks.iter() {
        position_hash.insert(*mark, HashMap::new());
    }

    for (row_index, row) in first_picture_rows.iter().enumerate() {
        for (char_index, chr) in row.chars().enumerate() {
            if chr == '.' {
                continue
            }

            position_hash.get_mut(&chr).unwrap().insert("first", Position{y: row_index, x: char_index});
        }
    }

    for (row_index, row) in second_picture_rows.iter().enumerate() {
        for (char_index, chr) in row.chars().enumerate() {
            if chr == '.' {
                continue
            }

            position_hash.get_mut(&chr).unwrap().insert("second", Position{y: row_index, x: char_index});
        }
    }

    for mark in marks.iter() {
        let y_speed: f32 = (position_hash[mark][&"second"].y as f32 - position_hash[mark][&"first"].y as f32) / (t2 - t1) as f32;
        let x_speed: f32 = (position_hash[mark][&"second"].x as f32 - position_hash[mark][&"first"].x as f32) / (t2 - t1) as f32;

        let third_y: i32 = position_hash[mark][&"second"].y as i32 + (y_speed * (t3 - t2) as f32).floor() as i32;
        let third_x: i32 = position_hash[mark][&"second"].x as i32 + (x_speed * (t3 - t2) as f32).floor() as i32;

        if third_y < 0 || h <= third_y {
            continue;
        }

        if third_x < 0 || w <= third_x {
            continue;
        }

        position_hash.get_mut(mark).unwrap().insert("third", Position{y: third_y as usize, x: third_x as usize});
    }

    marks.sort();
    marks.reverse();

    let mut third_picture_grid: Vec<Vec<String>> = vec![vec![".".to_string();w as usize];h as usize];
    for mark in marks {
        let third_position: Option<&Position> = position_hash.get(&mark).unwrap().get(&"third");
        if third_position.is_none() {
            continue;
        }

        let third_y: usize = third_position.unwrap().y;
        let third_x: usize = third_position.unwrap().x;

        third_picture_grid[third_y][third_x] = mark.to_string();
    }

    let results: Vec<String> = third_picture_grid.iter().map(|row| row.join("")).collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Position {
    y: usize,
    x: usize
}
