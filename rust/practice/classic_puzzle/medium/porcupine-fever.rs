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
    let y = parse_input!(input_line, i32);
    let mut cages: Vec<Cage> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let s = parse_input!(inputs[0], i32);
        let h = parse_input!(inputs[1], i32);
        let a = parse_input!(inputs[2], i32);

        cages.push(Cage{sick: s as i64, healthy: h as i64, alive: a as i64});
    }
    for i in 0..y as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let mut alive: i64 = 0;
        for cage in cages.iter_mut() {
            let sick: i64 = cage.sick * 2i64.pow(i as u32);
            cage.alive -= sick;

            alive += [cage.alive, 0].iter().max().unwrap();
        }

        let result: String = alive.to_string();

        // println!("answer");
        println!("{result}");

        if alive == 0 {
            break;
        }
    }
}

struct Cage {
    sick: i64,
    healthy: i64,
    alive: i64
}
