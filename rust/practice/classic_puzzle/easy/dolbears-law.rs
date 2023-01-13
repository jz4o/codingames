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
    let m = parse_input!(input_line, i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..m as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let grid: Vec<Vec<i32>> = lines.iter().map(|line| line.split_whitespace().map(|s| s.parse::<i32>().unwrap()).collect()).collect();

    let mut tc_n60: f32 = 0f32;
    for row in grid.iter() {
        tc_n60 += 10f32 + (row.iter().sum::<i32>() - 40) as f32 / 7f32;
    }
    tc_n60 /= grid.len() as f32;

    let mut tc_n8: Option<f32> = None;
    if 5f32 <= tc_n60 && tc_n60 <= 30f32 {
        let mut chirps: Vec<&i32> = grid.iter().flatten().collect();
        if chirps.len() % 2 == 1 {
            chirps.pop();
        }

        tc_n8 = Some(0f32);
        for i in (0..chirps.len()).step_by(2) {
            tc_n8 = Some(tc_n8.unwrap() + *chirps[i] as f32 + *chirps[i + 1] as f32 + 5f32);
        }
        tc_n8 = Some(tc_n8.unwrap() / (chirps.len() / 2) as f32);
    }

    let mut results: Vec<String> = Vec::new();
    results.push(format!("{:.1}", tc_n60));
    if tc_n8.is_some() {
        results.push(format!("{:.1}", tc_n8.unwrap()));
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
