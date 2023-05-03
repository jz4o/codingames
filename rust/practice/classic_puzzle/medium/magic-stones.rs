use std::io;

use itertools::Itertools;

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
    let mut stones: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let level = parse_input!(i, i32);
        stones.push(level);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut stone_count: usize = 0;
    let mut levels: Vec<i32> = Vec::new();
    for stone in stones.iter() {
        if !levels.contains(stone) {
            levels.push(*stone);
        }
    }
    levels.sort();

    while !levels.is_empty() {
        let level: i32 = levels.remove(0);
        let mut target_stone_count: usize = stones.iter().filter(|l| l == &&level).count();
        let next_level_stone_count: usize = target_stone_count / 2;
        target_stone_count = target_stone_count % 2;

        stones = stones
            .iter()
            .filter(|stone| stone != &&level)
            .map(|stone| *stone)
            .collect();

        if next_level_stone_count > 0 {
            stones.extend(vec![level + 1; next_level_stone_count]);
            levels.insert(0, level + 1);
        }

        stone_count += target_stone_count;
    }

    // println!("1");
    println!("{stone_count}");
}
