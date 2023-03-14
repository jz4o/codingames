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
    let w = parse_input!(inputs[0], i32); // number of columns.
    let h = parse_input!(inputs[1], i32); // number of rows.
    let mut lines: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string(); // represents a line in the grid and contains W integers. Each integer represents one room of a given type.
        lines.push(line);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let ex = parse_input!(input_line, i32); // the coordinate along the X axis of the exit (not useful for this first mission, but must be read).

    let panel_destination: HashMap<&str, [&str;14]> = HashMap::from([
        ("TOP", ["NONE", "BOTTOM", "NONE", "BOTTOM", "LEFT", "RIGHT", "NONE", "BOTTOM", "NONE", "BOTTOM", "LEFT", "RIGHT", "NONE", "NONE"]),
        ("LEFT", ["NONE", "BOTTOM", "RIGHT", "NONE", "NONE", "BOTTOM", "RIGHT", "NONE", "BOTTOM", "BOTTOM", "NONE", "NONE", "NONE", "BOTTOM"]),
        ("RIGHT", ["NONE", "BOTTOM", "LEFT", "NONE", "BOTTOM", "NONE", "LEFT", "BOTTOM", "BOTTOM", "NONE", "NONE", "NONE", "BOTTOM", "NONE"])
    ]);

    let grid: Vec<Vec<usize>> = lines
        .iter()
        .map(|line| line.split_whitespace().map(|c| c.to_string().parse::<usize>().unwrap()).collect())
        .collect();

    // game loop
    loop {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let xi = parse_input!(inputs[0], i32);
        let yi = parse_input!(inputs[1], i32);
        let pos = inputs[2].trim().to_string();

        // Write an action using println!("message...");
        // To debug: eprintln!("Debug message...");

        let panel_type: usize = grid[yi as usize][xi as usize];
        let next_dest: &str = panel_destination[&pos.as_str()][panel_type];

        let (next_xi, next_yi): (i32, i32) = match next_dest {
            "LEFT" => (xi - 1, yi),
            "RIGHT" => (xi + 1, yi),
            "BOTTOM" => (xi, yi + 1),
            _ => (0, 0) // Not Arrive
        };

        let result: String = format!("{next_xi} {next_yi}");

        // One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
        // println!("0 0");
        println!("{result}");
    }
}
