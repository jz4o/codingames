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
    let rounds = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let cash = parse_input!(input_line, i32);
    let mut plays: Vec<String> = Vec::new();
    for i in 0..rounds as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let play = input_line.trim_matches('\n').to_string();
        plays.push(play);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut result: i32 = cash;
    for play in plays {
        let play_elements: Vec<&str> = play.split(" ").collect();
        let ball: i32 = play_elements[0].parse().unwrap();
        let call: &str = play_elements[1];
        let mut number: i32 = -1;
        if play_elements.len() >= 3 {
            number = play_elements[2].parse().unwrap();
        }

        let bet: i32 = (result as f32 / 4.0).ceil() as i32;
        result -= bet;

        if call == "PLAIN" && ball == number {
            result += bet * 36;
        } else if call == "ODD" && ball % 2 == 1 {
            result += bet * 2;
        } else if call == "EVEN" && ball % 2 == 0 && ball > 0 {
            result += bet * 2;
        }
    }

    // println!("cash of the target after playing");
    println!("{}", result);
}
