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
    let n = input_line.trim().to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let digits: Vec<i32> = n.chars().map(|c| c.to_string().parse::<i32>().unwrap()).collect();
    let max_digit: i32 = *digits.iter().max().unwrap();

    let mut chunk_size: usize = 1;
    let mut base: i32 = 1;
    loop {
        base += 1;
        if max_digit < base {
            break;
        }

        let mut temp_chunk: Vec<i32> = Vec::new();
        for digit in digits.iter() {
            let mod_num: i32 = digit % base;
            if temp_chunk.last().unwrap_or(&-1) != &mod_num {
                temp_chunk.push(mod_num);
            }
        }

        let temp_chunk_size: usize = temp_chunk.len();
        if temp_chunk_size < chunk_size {
            break;
        }

        chunk_size = temp_chunk_size;
    }

    let result: String = if max_digit < base { "Normal".to_string() } else { base.to_string() };

    // println!("Normal");
    println!("{result}");
}
