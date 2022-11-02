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
    let l = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let f = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let n = parse_input!(inputs[0], i32);
    let k = parse_input!(inputs[1], i32);
    let mut crewmates: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let crewmate = input_line.trim_matches('\n').to_string();
        crewmates.push(crewmate);
    }
    for i in 0..n as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let crewmate: String = crewmates[i].to_string();
        let mut logs: Vec<Log> = Vec::new();
        for index in 0..crewmate.len() {
            let chr: char = crewmate.chars().nth(index).unwrap();
            if f.contains(chr) {
                logs.push(Log{ time: index as i32, room_index: f.find(chr).unwrap() as i32 })
            }
        }

        let mut is_sus: bool = false;
        if logs.len() >= 2 {
            for index in 0..(logs.len() - 1) {
                let l: &Log = logs.get(index).unwrap();
                let r: &Log = logs.get(index + 1).unwrap();

                let time: i32 = r.time - l.time;
                let mut distance: i32 = (r.room_index - l.room_index).abs();
                distance = *[distance, f.len() as i32 - distance].iter().min().unwrap();

                if time < distance {
                    is_sus = true;
                    break;
                }
            }
        }

        let result: &str = if is_sus { "SUS" } else { "NOT SUS" };

        // println!("answer");
        println!("{result}");
    }
}

struct Log {
    time: i32,
    room_index: i32
}
