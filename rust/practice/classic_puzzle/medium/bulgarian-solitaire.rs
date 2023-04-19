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
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut cs: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let c = parse_input!(i, i32);
        cs.push(c);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut piles: Vec<i32> = cs.iter().filter(|c| c!= &&0).map(|c| *c).collect();

    let same_configuration_index: usize;
    let mut configurations: Vec<String> = Vec::new();
    loop {
        piles.sort();
        configurations.push(piles.iter().map(|pile| pile.to_string()).collect::<Vec<String>>().join(" "));

        let piles_size: usize = piles.len();
        piles = piles.iter().map(|pile| pile - 1).filter(|&pile| pile != 0).collect();
        piles.push(piles_size as i32);

        piles.sort();
        let configuration: String = piles.iter().map(|pile| pile.to_string()).collect::<Vec<String>>().join(" ");

        if configurations.contains(&configuration) {
            same_configuration_index = configurations.iter().position(|c| c == &configuration).unwrap();
            break;
        }
    }

    let result: String = (configurations.len() - same_configuration_index).to_string();

    // println!("1");
    println!("{result}");
}
