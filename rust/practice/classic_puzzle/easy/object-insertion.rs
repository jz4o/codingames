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
    let a = parse_input!(inputs[0], i32);
    let b = parse_input!(inputs[1], i32);
    let mut object_lines: Vec<String> = Vec::new();
    for i in 0..a as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let object_line = input_line.trim_matches('\n').to_string();
        object_lines.push(object_line);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let c = parse_input!(inputs[0], i32);
    let d = parse_input!(inputs[1], i32);
    let mut grid_lines: Vec<String> = Vec::new();
    for i in 0..c as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let grid_line = input_line.trim_matches('\n').to_string();
        grid_lines.push(grid_line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<String>> = Vec::new();
    for grid_line in grid_lines {
        grid.push(grid_line.chars().map(|c| c.to_string()).collect());
    }

    let mut object_parts_points: Vec<Point> = Vec::new();
    for line_index in 0..object_lines.len() {
        let object_line: String = object_lines[line_index].to_string();
        for char_index in 0..object_line.len() {
            let chr: char = object_line.chars().nth(char_index).unwrap();
            if chr == '*' {
                object_parts_points.push(Point{ y: line_index, x: char_index });
            }
        }
    }

    let mut putable_points: Vec<Point> = Vec::new();
    for line_index in 0..(c - a + 1) as usize {
        for column_index in 0..(d - b + 1) as usize {
            let mut continue_flag: bool = false;
            for point in object_parts_points.iter() {
                if grid[line_index + point.y][column_index + point.x] != "." {
                    continue_flag = true;
                    break;
                }
            }

            if continue_flag {
                continue;
            }

            putable_points.push(Point{ y: line_index, x: column_index });
        }
    }

    let mut results: Vec<String> = Vec::new();

    results.push(putable_points.len().to_string());
    if putable_points.len() == 1 {
        let putable_point: &Point = &putable_points[0];

        for object_parts_point in object_parts_points {
            let y: usize = putable_point.y + object_parts_point.y;
            let x: usize = putable_point.x + object_parts_point.x;

            grid[y][x] = "*".to_string();
        }

        for line in grid {
            results.push(line.join(""));
        }
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Point {
    y: usize,
    x: usize
}
