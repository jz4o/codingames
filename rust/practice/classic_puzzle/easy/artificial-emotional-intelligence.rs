use std::io;

use regex::Regex;

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
    let name = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let AD_LIST: Vec<&str> = vec![
        "adaptable",
        "adventurous",
        "affectionate",
        "courageous",
        "creative",
        "dependable",
        "determined",
        "diplomatic",
        "giving",
        "gregarious",
        "hardworking",
        "helpful",
        "hilarious",
        "honest",
        "non-judgmental",
        "observant",
        "passionate",
        "sensible",
        "sensitive",
        "sincere"
    ];

    let GOOD_LIST: Vec<&str> = vec!["love", "forgiveness", "friendship", "inspiration", "epic transformations", "wins"];
    let BAD_LIST: Vec<&str> = vec!["crime", "disappointment", "disasters", "illness", "injury", "investment loss"];

    let VOWELS: Vec<String> = "aeiouy".chars().map(|c| c.to_string()).collect();
    let CONSONANTS: Vec<String>= "bcdfghjklmnpqrstvwxz".chars().map(|c| c.to_string()).collect();

    let lower_name: String = Regex::new("[a-z]").unwrap().find_iter(&name.to_lowercase()).map(|f| f.as_str()).collect::<Vec<&str>>().join("");

    let mut consonants: Vec<String> = Vec::new();
    for chr in lower_name.chars().map(|c| c.to_string()) {
        if CONSONANTS.contains(&chr) && !consonants.contains(&chr) {
            consonants.push(chr.to_string());
        }
    }
    let first_consonant: &String = &if consonants.len() > 0 { consonants[0].to_string() } else { "".to_string() };
    let second_consonant: &String = &if consonants.len() > 1 { consonants[1].to_string() } else { "".to_string() };
    let third_consonant: &String = &if consonants.len() > 2 { consonants[2].to_string() } else { "".to_string() };

    let mut vowels: Vec<String> = Vec::new();
    for chr in lower_name.chars().map(|c| c.to_string()) {
        if VOWELS.contains(&chr) {
            vowels.push(chr.to_string());
        }
    }
    let good_vowel: &String = &if vowels.len() > 0 { vowels[0].to_string() } else { "".to_string() };
    let bad_vowel: &String = &if vowels.len() > 1 { vowels[1].to_string() } else { "".to_string() };

    let mut results: Vec<String> = Vec::new();
    if [first_consonant, second_consonant, third_consonant, good_vowel, bad_vowel].iter().all(|str| str.len() > 0) {
        let first_ad: &str = AD_LIST[CONSONANTS.iter().position(|consonant| consonant == first_consonant).unwrap()];
        let second_ad: &str = AD_LIST[CONSONANTS.iter().position(|consonant| consonant == second_consonant).unwrap()];
        let third_ad: &str = AD_LIST[CONSONANTS.iter().position(|consonant| consonant == third_consonant).unwrap()];
        let good: &str = GOOD_LIST[VOWELS.iter().position(|vowel| vowel == good_vowel).unwrap()];
        let bad : &str = BAD_LIST[VOWELS.iter().position(|vowel| vowel == bad_vowel).unwrap()];

        results.push(format!("It's so nice to meet you, my dear {first_ad} {name}."));
        results.push(format!("I sense you are both {second_ad} and {third_ad}."));
        results.push(format!("May our future together have much more {good} than {bad}."));
    } else {
        results.push(format!("Hello {name}."));
    }

    // println!("Hello Lisa.");
    for result in results {
        println!("{result}");
    }
}
