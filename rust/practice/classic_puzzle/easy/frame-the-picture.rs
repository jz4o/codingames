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
    let frame_pattern = input_line.trim_matches('\n').to_string(); // the ASCII art pattern to use to frame the picture
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let h = parse_input!(inputs[0], i32); // the height of the picture
    let w = parse_input!(inputs[1], i32); // the width  of the picture
    let mut lines: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string(); // the ASCII art picture line by line
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<String>> = Vec::new();
    for line in lines {
        let row: Vec<String> = format!("{1:0$}", w as usize, line).chars().map(|c| c.to_string()).collect();
        grid.push(row);
    }

    for frame_char in format!("{frame_pattern} ").chars().rev() {
        grid = surround(grid, frame_char.to_string());
    }

    let results: Vec<String> = grid.iter().map(|row| row.join("")).collect();

    // println!("Write framed picture line by line here");
    for result in results {
        println!("{result}");
    }
}

fn surround(mut grid: Vec<Vec<String>>, frame_char: String) -> Vec<Vec<String>> {
    for i in 0..grid.len() {
        grid[i].insert(0, frame_char.to_string());
        grid[i].push(frame_char.to_string());
    }
    grid.insert(0, vec![frame_char.to_string();grid.first().unwrap().len()]);
    grid.push(vec![frame_char.to_string();grid.first().unwrap().len()]);

    return grid;
}
