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
    let mut marks: HashMap<&str, &str> = HashMap::new();
    marks.insert("black", "#");
    marks.insert("white", ".");

    let mut directions: Vec<&str> = vec!["N", "E", "S", "W"];

    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let x = parse_input!(inputs[0], i32);
    let y = parse_input!(inputs[1], i32);
    let mut ux: usize = x as usize;
    let mut uy: usize = y as usize;
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let direction = input_line.trim().to_string();
    while directions.first().unwrap() != &direction {
        directions.rotate_left(1);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let t = parse_input!(input_line, i32);
    let mut grid: Vec<Vec<String>> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let c = input_line.trim_matches('\n').to_string();
        grid.push(c.chars().map(|c| c.to_string()).collect());
    }
    for i in 0..t as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let color_is_black: bool = grid[uy][ux] == marks["black"];
        if color_is_black {
            directions.rotate_left(1);
        } else {
            directions.rotate_right(1);
        }

        grid[uy][ux] = if color_is_black {
            marks["white"].to_string()
        } else {
            marks["black"].to_string()
        };

        match directions.first().unwrap().to_string().as_str() {
            "N" => uy -= 1,
            "E" => ux += 1,
            "W" => ux -= 1,
            "S" => uy += 1,
            _ => ()
        }

        // println!("answer");
    }

    let results: Vec<String> = grid.iter().map(|row| row.join("")).collect();

    for result in results {
        println!("{result}");
    }
}
