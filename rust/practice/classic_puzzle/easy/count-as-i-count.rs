use std::io;

use std::collections::HashMap;

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

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const TARGET_SCORE: i32 = 50;
    const POSSIBLE_ROUNDS: usize = 4;

    let mut patterns: HashMap<String, Pattern> = HashMap::new();
    patterns.insert(n.to_string(), Pattern{numbers: vec![n], count: 1, score: n});

    let mut result: usize = 0;
    while !patterns.is_empty() {
        let pattern_numbers: String = patterns.keys().last().unwrap().to_string();
        let pattern: Pattern = patterns.remove(&pattern_numbers).unwrap();

        // between 2 and 12 is 2 patterns for PN and N
        for i in [vec![1], (2..12 + 1).collect(), (2..12 + 1).collect()].concat() {
            let new_numbers: String = [pattern.numbers.to_vec(), vec![i]]
                .concat()
                .iter()
                .rev()
                .join(" ");

            if patterns.contains_key(&new_numbers) {
                patterns.get_mut(&new_numbers).unwrap().count += pattern.count;
            } else {
                let new_pattern: Pattern = Pattern {
                    numbers: [pattern.numbers.to_vec(), vec![i]].concat(),
                    count: pattern.count,
                    score: pattern.score + i
                };

                patterns.insert(new_numbers, new_pattern);
            }
        }

        // delete pattern for over score or over rounds
        patterns.retain(|k, v| v.score <= TARGET_SCORE && v.numbers.len() <= POSSIBLE_ROUNDS + 1);

        // add possible pattern to result
        result += patterns.iter().filter(|(k, v)| v.score == TARGET_SCORE).map(|(k, v)| v.count).sum::<usize>();
        patterns.retain(|k, v| v.score < TARGET_SCORE)
    }

    // println!("answer");
    println!("{result}");
}

struct Pattern {
    numbers: Vec<i32>,
    count: usize,
    score: i32
}
