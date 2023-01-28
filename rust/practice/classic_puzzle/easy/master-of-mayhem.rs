use std::io;

use std::collections::HashMap;
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
    let cyborg_count = parse_input!(input_line, i32);
    let mut cyborg_names: Vec<String> = Vec::new();
    for i in 0..cyborg_count as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let cyborg_name = input_line.trim().to_string();
        cyborg_names.push(cyborg_name);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let mayhem_report_count = parse_input!(input_line, i32);
    let mut mayhem_reports: Vec<String> = Vec::new();
    for i in 0..mayhem_report_count as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let mayhem_report = input_line.trim_matches('\n').to_string();
        mayhem_reports.push(mayhem_report);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let cyborg_report_count = parse_input!(input_line, i32);
    let mut cyborg_reports: Vec<String> = Vec::new();
    for i in 0..cyborg_report_count as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let cyborg_report = input_line.trim_matches('\n').to_string();
        cyborg_reports.push(cyborg_report);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut mayhem_attributes: HashMap<String, String> = HashMap::new();
    let mayhem_report_regex: Regex= Regex::new("^Mayhem's (.*?) (is)?( an?)? \"?(.*?)\"?$").unwrap();
    for mayhem_report in mayhem_reports.iter() {
        let mayhem_report_elements: regex::Captures = mayhem_report_regex.captures(mayhem_report).unwrap();

        let attribute: String = mayhem_report_elements.get(1).unwrap().as_str().to_string();
        let value: String = mayhem_report_elements.get(mayhem_report_elements.len() - 1).unwrap().as_str().to_string();

        mayhem_attributes.insert(attribute, value);
    }

    let mut cyborgs_attributes: HashMap<String, HashMap<String, String>> = HashMap::new();
    for name in cyborg_names.iter() {
        cyborgs_attributes.insert(name.to_string(), HashMap::new());
    }
    let cyborg_report_regex: Regex = Regex::new("^(.*?)'s (.*?) (is)?( an?)? \"?(.*?)\"?$").unwrap();
    for cyborg_report in cyborg_reports.iter() {
        let cyborg_report_elements: regex::Captures = cyborg_report_regex.captures(cyborg_report).unwrap();

        let name: String = cyborg_report_elements.get(1).unwrap().as_str().to_string();
        let attribute: String = cyborg_report_elements.get(2).unwrap().as_str().to_string();
        let value: String = cyborg_report_elements.get(cyborg_report_elements.len() - 1).unwrap().as_str().to_string();

        cyborgs_attributes.get_mut(&name).unwrap().insert(attribute, value);
    }

    for (mayhem_attribute, mayhem_value) in mayhem_attributes.iter() {
        cyborgs_attributes.retain(|cyborg_name, cyborg_attributes|
            if mayhem_attribute == "word" {
                cyborg_attributes.get("catchphrase").is_none() || cyborg_attributes["catchphrase"].contains(mayhem_value)
            } else {
                cyborg_attributes.get(mayhem_attribute).is_none() || mayhem_value == &cyborg_attributes[mayhem_attribute]
            }
        );
    }

    let candidate_cyborg_names: Vec<&String> = cyborgs_attributes.keys().collect();

    let result: &str = match candidate_cyborg_names.len() {
        0 => "MISSING",
        1 => candidate_cyborg_names.first().unwrap(),
        _ => "INDETERMINATE"
    };

    // println!("CYBORG");
    println!("{result}");
}
