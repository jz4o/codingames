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
    let x = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut ms: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let m = parse_input!(i, i32);
        ms.push(m);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    fn w(l: f64, m: f64) -> f64 {
        return (l - 1 as f64) * 6.5 / 100.0 * 10.0 * m;
    }

    ms.sort();
    ms.reverse();

    let mut works: Vec<f64> = Vec::new();
    for i in 0..(n as f32 / x as f32).ceil() as i32 {
        let l: f64 = (i + 1) as f64;
        let begin_index: usize = (i * x) as usize;
        let end_index: usize = *[begin_index + x as usize, ms.len()].iter().min().unwrap();

        for j in begin_index..end_index {
            works.push(w(l, ms[j] as f64));
        }
    }

    let result: String = format!("{:.3}", works.iter().sum::<f64>());

    // println!("answer");
    println!("{result}");
}
