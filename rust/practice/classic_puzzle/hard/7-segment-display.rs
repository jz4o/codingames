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
    let n = parse_input!(input_line, i64);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let c = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let s = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<char>> = Vec::new();
    for digit in n.to_string().chars().map(|c| c.to_string().parse::<usize>().unwrap()) {
        let tl_parts: String = get_segment_char(digit, "tl", c.to_string()).repeat(s as usize);
        let bl_parts: String = get_segment_char(digit, "bl", c.to_string()).repeat(s as usize);
        grid.push(format!(" {tl_parts} {bl_parts} ").chars().collect::<Vec<char>>());

        let t_parts: String = get_segment_char(digit, "t", c.to_string());
        let c_parts: String = get_segment_char(digit, "c", c.to_string());
        let b_parts: String = get_segment_char(digit, "b", c.to_string());
        let tcb: String = [t_parts, c_parts, b_parts].join(&" ".repeat(s as usize));
        grid.extend(vec![tcb.chars().collect::<Vec<char>>();s as usize]);

        let tr_parts: String = get_segment_char(digit, "tr", c.to_string()).repeat(s as usize);
        let br_parts: String = get_segment_char(digit, "br", c.to_string()).repeat(s as usize);
        grid.push(format!(" {tr_parts} {br_parts} ").chars().collect::<Vec<char>>());

        grid.push(" ".repeat(s as usize * 2 + 3).chars().collect::<Vec<char>>());
    }

    let mut results: Vec<String> = Vec::new();
    for row in transpose(grid) {
        let result = row
            .iter()
            .map(|c| c.to_string())
            .collect::<Vec<String>>()
            .join("")
            .trim_end()
            .to_string();

        results.push(result);
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

fn get_segment_char(num: usize, pos: &str, c: String) -> String {
    let segments: Vec<Vec<&str>> = vec![
        vec!["t", "tl", "tr", "bl", "br", "b"],
        vec!["tr", "br"],
        vec!["t", "tr", "c", "bl", "b"],
        vec!["t", "tr", "c", "br", "b"],
        vec!["tl", "tr", "c", "br"],
        vec!["t", "tl", "c", "br", "b"],
        vec!["t", "tl", "c", "bl", "br", "b"],
        vec!["t", "tr", "br"],
        vec!["t", "tl", "tr", "c", "bl", "br", "b"],
        vec!["t", "tl", "tr", "c", "br", "b"]
    ];

    return if segments[num].contains(&pos) { c } else { " ".to_string() };
}

fn transpose(grid: Vec<Vec<char>>) -> Vec<Vec<char>> {
    let grid_column_size: usize = grid.first().unwrap().len();

    let mut results: Vec<Vec<char>> = vec![Vec::new();grid_column_size];

    for column_index in 0..grid_column_size {
        for row in grid.iter() {
            results.get_mut(column_index).unwrap().push(row[column_index]);
        }
    }

    return results;
}
