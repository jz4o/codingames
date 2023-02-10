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
    let mut words: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let word = input_line.trim().to_string();
        words.push(word);
    }
    let mut results: Vec<String> = Vec::new();
    for i in 0..n as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let word: String = words[i].to_string();

        let prefix_length: usize = (1..word.len() + 1)
            .find(|length| words.iter().filter(|w| w.starts_with(&word[..*length])).count() == 1)
            .unwrap_or(word.len());

        let result: String = word[..prefix_length].to_string();

        // println!("<word_prefix>");
        results.push(result);
    }

    for result in results {
        println!("{result}");
    }
}
