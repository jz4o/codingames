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
    let size = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut names: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let name = input_line.trim_matches('\n').to_string();
        names.push(name);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let t = parse_input!(input_line, i32);
    let mut throw_datas: Vec<ThrowData> = Vec::new();
    for i in 0..t as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let throw_name = inputs[0].trim().to_string();
        let throw_x = parse_input!(inputs[1], i32);
        let throw_y = parse_input!(inputs[2], i32);

        throw_datas.push(ThrowData{name: throw_name, x: throw_x, y: throw_y});
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let half_size: i32 = size / 2;
    let mut score_board: HashMap<String, i32> = HashMap::new();
    for name in names.iter() {
        score_board.insert(name.to_string(), 0);
    }

    for throw_data in throw_datas {
        let distance_with_center: f32 = ((throw_data.x.pow(2 as u32) + throw_data.y.pow(2 as u32)) as f32).sqrt();
        let distance_with_edge: f32 = (((half_size - throw_data.x.abs()).pow(2 as u32) + (half_size - throw_data.y.abs()).pow(2 as u32)) as f32).sqrt();

        let in_square_horizontal: bool = half_size * -1 <= throw_data.x && throw_data.x <= half_size;
        let in_square_vertical: bool = half_size * -1 <= throw_data.y && throw_data.y <= half_size;

        let in_square: bool = in_square_horizontal && in_square_vertical;
        let in_circle: bool = distance_with_center <= half_size as f32;
        let in_diamond: bool = distance_with_center <= distance_with_edge;

        if in_diamond {
            *score_board.get_mut(&throw_data.name).unwrap() += 15;
        } else if in_circle {
            *score_board.get_mut(&throw_data.name).unwrap() += 10;
        } else if in_square {
            *score_board.get_mut(&throw_data.name).unwrap() += 5;
        }
    }

    let mut scores: Vec<Score> = score_board.iter().map(|(name, score)| Score{name: name.to_string(), score: *score}).collect();

    scores.sort_by(|a, b|
        b.score.partial_cmp(&a.score).unwrap()
            .then(names.iter().position(|name| name == &a.name).unwrap().partial_cmp(&names.iter().position(|name| name == &b.name).unwrap()).unwrap())
    );

    let results: Vec<String> = scores.iter().map(|score| format!("{} {}", score.name, score.score)).collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct ThrowData {
    name: String,
    x: i32,
    y: i32
}

struct Score {
    name: String,
    score: i32
}
