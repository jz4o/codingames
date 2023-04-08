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
    let n = parse_input!(input_line, i32);
    let mut input_lines: Vec<(i32, i32)> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let x = parse_input!(inputs[0], i32);
        let y = parse_input!(inputs[1], i32);

        input_lines.push((x, y));
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut points: Vec<Point> = Vec::new();
    let mut xs: Vec<i32> = vec![0];
    let mut ys: Vec<i32> = vec![0];
    for (x, y) in input_lines.iter() {
        points.push(Point{x: *x as usize, y: *y as usize});
        xs.push(*x);
        ys.push(*y);
    }

    let y_plus_length: usize = ys.iter().max().unwrap().abs() as usize + 1;
    let y_minus_length: usize = ys.iter().min().unwrap().abs() as usize + 1;
    let x_plus_length: usize = xs.iter().max().unwrap().abs() as usize + 1;
    let x_minus_length: usize = xs.iter().min().unwrap().abs() as usize + 1;

    let y_length: usize = y_plus_length + y_minus_length + 1;
    let x_length: usize = x_plus_length + x_minus_length + 1;
    let mut grid: Vec<Vec<String>> = vec![vec![".".to_string(); x_length]; y_length];

    let zero_point: Point = Point{x: x_minus_length, y: y_plus_length};

    grid[zero_point.y] = vec!["-".to_string(); x_length];
    for row in grid.iter_mut() {
        row[zero_point.x] = "|".to_string();
    }
    grid[zero_point.y][zero_point.x] = "+".to_string();

    for point in points.iter() {
        grid[zero_point.y - point.y][zero_point.x + point.x] = "*".to_string();
    }

    let results: Vec<String> = grid.iter().map(|row| row.join("")).collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Point {
    x: usize,
    y: usize
}
