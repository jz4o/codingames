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
    let text_to_decode = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let alphabets: Vec<char> = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".chars().collect();

    let mut words: Vec<String> = text_to_decode.split_whitespace().map(|s| s.to_string()).collect();

    let mut result: String = "WRONG MESSAGE".to_string();
    for _ in 0..alphabets.len() {
        if words.contains(&"CHIEF".to_string()) {
            result = words.join(" ");
            break;
        }

        let mut temp_words: Vec<String> = Vec::new();
        for word in words.iter() {
            let mut temp_word: String = "".to_string();
            for chr in word.chars() {
                let mut index: usize = alphabets.iter().position(|&c| c == chr).unwrap();
                if index == 0 {
                    index = alphabets.len();
                }
                temp_word += &alphabets[index - 1].to_string();
            }
            temp_words.push(temp_word.to_owned());
        }
        words = temp_words;
    }

    // println!("DecodedText:string(101)");
    println!("{result}");
}
