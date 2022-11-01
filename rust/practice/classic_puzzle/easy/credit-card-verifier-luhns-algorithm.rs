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
    let mut cards: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let card = input_line.trim_matches('\n').to_string();

        cards.push(card);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();
    for card in cards {
        let mut sum_numbers: i32 = 0;

        let numbers: String = card.replace(" ", "");
        for i in 0..numbers.len() {
            let mut number: i32 = numbers.chars().nth(i).unwrap().to_string().parse().unwrap();
            if i % 2 == 0 {
                number *= 2;
                if number >= 10 {
                    number -= 9;
                }
            }

            sum_numbers += number;
        }

        let result: String = (if sum_numbers % 10 == 0 { "YES" } else { "NO" }).to_string();
        results.push(result);
    }

    // println!("YES or NO");
    for result in results {
        println!("{result}");
    }
}
