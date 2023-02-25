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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let parent_1 = inputs[0].trim().to_string();
    let parent_2 = inputs[1].trim().to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let ratio = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut parent_1_elements: Vec<String> = Vec::new();
    for front_c in parent_1[..2].chars() {
        for back_c in parent_1[2..].chars() {
            parent_1_elements.push(format!("{front_c}{back_c}"));
        }
    }

    let mut parent_2_elements: Vec<String> = Vec::new();
    for front_c in parent_2[..2].chars() {
        for back_c in parent_2[2..].chars() {
            parent_2_elements.push(format!("{front_c}{back_c}"));
        }
    }

    let mut child_candidates: Vec<String> = Vec::new();
    for parent_1_element in parent_1_elements.iter() {
        for parent_2_element in parent_2_elements.iter() {
            let mut child_candidate: Vec<String> = format!("{parent_1_element}{parent_2_element}").chars().map(|c| c.to_string()).collect();
            child_candidate.sort();

            child_candidates.push(child_candidate.join(""));
        }
    }

    let mut child_counts: HashMap<String, i32> = HashMap::new();
    for child_candidate in child_candidates.iter() {
        if !child_counts.contains_key(child_candidate) {
            child_counts.insert(child_candidate.to_string(), 0);
        }

        child_counts.insert(child_candidate.to_string(), child_counts[child_candidate] + 1);
    }

    let mut ratios: Vec<i32> = Vec::new();
    for r in ratio.split(":") {
        let mut r_chars: Vec<String> = r.chars().map(|c| c.to_string()).collect();
        r_chars.sort();

        let r_str: String = r_chars.join("");
        ratios.push(if child_counts.contains_key(&r_str) { child_counts[&r_str] } else { 0 });
    }

    let gcd_value: i32 = gcd(*ratios.first().unwrap(), *ratios.last().unwrap());

    let result: String = ratios.iter().map(|r| (r / gcd_value).to_string()).join(":");

    // println!("Genotypic Ratio");
    println!("{result}");
}

fn gcd(a: i32, b: i32) -> i32 {
    let min: i32 = std::cmp::min(a, b);
    let max: i32 = std::cmp::max(a, b);

    if min == 0 {
        return max;
    }

    return gcd(min, max % min);
}

