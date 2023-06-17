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
    let lengthofline = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut entries: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let entry = input_line.trim_matches('\n').to_string();
        entries.push(entry);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const INDENT: &str = "    ";

    let mut section_numbers: Vec<i32> = Vec::new();
    let results: Vec<String> = entries.iter().map(|entry| {
        let (content, page): (&str, &str) = entry.split_once(" ").unwrap();

        let indent_match: Option<regex::Match> = Regex::new(r"^>+").unwrap().find(content);
        let indent_str: String = if indent_match.is_some() { indent_match.unwrap().as_str().to_string() } else { "".to_string() };
        let indent_level: usize = indent_str.len();
        let indent: String = INDENT.repeat(indent_level);

        if section_numbers.len() <= indent_level {
            section_numbers.push(0);
        }
        section_numbers[indent_level] += 1;
        section_numbers = section_numbers[..indent_level + 1].to_vec();
        let section: String = format!("{} ", section_numbers[indent_level]);

        let title: String = content.to_string().replace(&indent_str, "");

        let dot_count: usize = lengthofline as usize - indent.len() - section.len() - title.len() - page.len();
        let dots: String = ".".repeat(dot_count);

        format!("{indent}{section}{title}{dots}{page}")
    }).collect();

    // println!("Format error");
    for result in results {
        println!("{result}");
    }
}
