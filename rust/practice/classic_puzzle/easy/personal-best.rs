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
    let gymnasts = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let categories = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let gymnasts_vec: Vec<String> = gymnasts.split(",").map(|gymnast| gymnast.to_string()).collect();
    let categories_vec: Vec<&str> = categories.split(",").collect();

    let mut scores: HashMap<String, HashMap<&str, f32>> = HashMap::new();
    for row in rows.iter() {
        let row_elements: Vec<&str> = row.split(",").collect();

        let gymnast: String = row_elements[0].to_string();
        if !gymnasts_vec.contains(&gymnast) {
            continue;
        }

        let bars: f32 = row_elements[1].parse::<f32>().unwrap();
        let beam: f32 = row_elements[2].parse::<f32>().unwrap();
        let floor: f32 = row_elements[3].parse::<f32>().unwrap();

        if !scores.contains_key(&gymnast) {
            scores.insert(gymnast.to_string(), HashMap::from([("bars", 0f32), ("beam", 0f32), ("floor", 0f32)]));
        }

        if scores[&gymnast]["bars"] < bars {
            scores.get_mut(&gymnast).unwrap().insert("bars", bars);
        }
        if scores[&gymnast]["beam"] < beam {
            scores.get_mut(&gymnast).unwrap().insert("beam", beam);
        }
        if scores[&gymnast]["floor"] < floor {
            scores.get_mut(&gymnast).unwrap().insert("floor", floor);
        }
    }

    let mut results: Vec<String> = Vec::new();
    for gymnast in gymnasts_vec.iter() {
        let result: String = categories_vec
            .iter()
            .map(|category| scores[gymnast][category].to_string())
            .collect::<Vec<String>>()
            .join(",");

        results.push(result);
    }

    // println!("0.00");
    for result in results {
        println!("{result}");
    }
}
