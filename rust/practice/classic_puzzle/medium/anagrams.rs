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
    let phrase = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let size_of_words: Vec<usize> = phrase.split_whitespace().map(|word| word.len()).collect();
    let mut phrase_chars: Vec<String> = phrase
        .chars()
        .map(|c| c.to_string().trim().to_string())
        .filter(|s| s != "")
        .collect();

    let mut words: Vec<String> = Vec::new();
    for size_of_word in size_of_words.iter().rev() {
        let word: String = phrase_chars[..*size_of_word].join("");
        words.push(word.to_string());

        phrase_chars = phrase_chars[*size_of_word..].to_vec();
    }

    let mut temp_phrase: String = words.join(" ");

    temp_phrase = part_unshift(temp_phrase.to_string(), get_indexes(temp_phrase.to_string(), get_alphabets_every_by(4)));
    temp_phrase = part_shift(temp_phrase.to_string(), get_indexes(temp_phrase.to_string(), get_alphabets_every_by(3)));
    temp_phrase = part_reverse(temp_phrase.to_string(), get_indexes(temp_phrase.to_string(), get_alphabets_every_by(2)));

    let result: String = temp_phrase.to_string();

    // println!("answer");
    println!("{result}");
}

fn get_alphabets_every_by(num: usize) -> Vec<String> {
    let alphabets: Vec<String> = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".chars().map(|c| c.to_string()).collect();

    let result: Vec<String> = alphabets
        .iter()
        .enumerate()
        .filter(|(index, _)| (index + 1) % num == 0)
        .map(|(_, alphabet)| alphabet.to_string())
        .collect();

    return result;
}

fn get_indexes(string: String, search_vec: Vec<String>) -> Vec<usize> {
    let result: Vec<usize> = string
        .chars()
        .map(|c| c.to_string())
        .enumerate()
        .filter(|(_, s)| search_vec.contains(s)).map(|(index, _)| index)
        .collect();

    return result;
}

fn part_shift(string: String, indexes: Vec<usize>) -> String {
    if indexes.is_empty() {
        return string;
    }

    let mut result: String = string.to_string();
    for index in 0..indexes.len() - 1 {
        let index_in_string: usize = indexes[index];
        let next_index_in_string: usize = indexes[index + 1];

        let left: usize = *[index_in_string, next_index_in_string].iter().min().unwrap();
        let right: usize = (index_in_string as i32 - next_index_in_string as i32).abs() as usize - 1;

        result = Regex::new(&format!("(.{{{left}}})(.)(.{{{right}}})(.)(.*)"))
            .unwrap()
            .replace(&result, "$1$4$3$2$5")
            .to_string();
    }

    return result;
}

fn part_unshift(string: String, indexes: Vec<usize>) -> String {
    let mut reversed_indexes: Vec<usize> = indexes.to_vec();
    reversed_indexes.reverse();

    return part_shift(string, reversed_indexes);
}

fn part_reverse(string: String, indexes: Vec<usize>) -> String {
    let mut result: String = string.to_string();

    let mut temp_indexes: Vec<usize> = indexes.to_vec();
    while 2 <= temp_indexes.len() {
        let shift_index: usize = temp_indexes.remove(0);
        let pop_index: usize = temp_indexes.remove(temp_indexes.len() - 1);

        let left: usize = *[shift_index, pop_index].iter().min().unwrap();
        let right: usize = (shift_index as i32 - pop_index as i32).abs() as usize - 1;

        result = Regex::new(&format!("(.{{{left}}})(.)(.{{{right}}})(.)(.*)"))
            .unwrap()
            .replace(&result, "$1$4$3$2$5")
            .to_string();
    }

    return result;
}
