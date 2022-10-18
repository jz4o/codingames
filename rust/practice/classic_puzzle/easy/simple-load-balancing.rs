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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let k = parse_input!(input_line, i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut lis: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let li = parse_input!(i, i32);
        lis.push(li);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut i: i32 = k;
    while i > 0 {
        lis.sort();

        let first_element: i32 = lis[0];
        let first_element_count: i32 = lis.iter().filter(|&li| li == &first_element).count() as i32;
        let size: i32 = *[first_element_count, i].iter().min().unwrap();

        for j in 0..size as usize{
            lis[j] = first_element + 1;
        }

        i -= size;
    }

    let result: i32 = lis.iter().max().unwrap() - lis.iter().min().unwrap();

    // println!("answer");
    println!("{result}");
}
