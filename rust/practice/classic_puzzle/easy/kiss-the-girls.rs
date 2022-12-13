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
    let h = parse_input!(inputs[0], i32);
    let w = parse_input!(inputs[1], i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut girls: Vec<Girl> = Vec::new();
    for (line_index, line) in lines.iter().enumerate() {
        for (chr_index, chr) in line.chars().enumerate() {
            if chr != 'G' {
                continue;
            }

            let probability: f32 = *[line_index, chr_index].iter().min().unwrap() as f32 / (line_index.pow(2) + chr_index.pow(2) + 1) as f32;
            girls.push(Girl{y: line_index, x: chr_index, probability: probability});
        }
    }

    girls.sort_by(|a, b| a.probability.partial_cmp(&b.probability).unwrap());

    let mut not_catching_probability: f32 = 1.0;
    let catching_border: f32 = 0.6;

    let mut girl_count: i32 = 0;
    for girl in  girls.iter() {
        not_catching_probability *= (1.0 - girl.probability);
        if not_catching_probability < catching_border {
            break;
        }

        girl_count += 1;
    }

    let result: String = girl_count.to_string();

    // println!("max_girls");
    println!("{result}");
}

struct Girl {
    y: usize,
    x: usize,
    probability: f32
}
