use std::io;

use itertools::Itertools;
use regex::Regex;
use std::collections::HashMap;

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
    let sql_query = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let rows = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let table_header = input_line.trim_matches('\n').to_string();
    let mut table_rows: Vec<String> = Vec::new();
    for i in 0..rows as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let table_row = input_line.trim_matches('\n').to_string();
        table_rows.push(table_row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut columns: Vec<&str> = table_header.split_whitespace().collect();
    let mut records: Vec<HashMap<&str, &str>> = Vec::new();
    for table_row in table_rows.iter() {
        let mut record: HashMap<&str, &str> = HashMap::new();
        for (&column, value) in columns.iter().zip(table_row.split_whitespace()) {
            record.insert(column, value);
        }
        records.push(record);
    }

    let mut sql_regex: String = "(SELECT)\\s(.*)\\s(FROM)\\s(.*)".to_string();
    if sql_query.contains("WHERE") {
        sql_regex += "\\s(WHERE)\\s(.*)";
    }
    if sql_query.contains("ORDER BY") {
        sql_regex += "\\s(ORDER BY)\\s(.*)";
    }

    let matched: regex::Captures = Regex::new(sql_regex.as_str()).unwrap().captures(sql_query.as_str()).unwrap();
    let mut query: HashMap<&str, &str> = HashMap::new();
    for i in (1..matched.len()).step_by(2) {
        let key: &str = matched.get(i).unwrap().as_str();
        let value: &str = matched.get(i + 1).unwrap().as_str();

        query.insert(key, value);
    }

    if query.contains_key("WHERE") {
        let (column, value): (&str, &str) = query["WHERE"].split(" = ").collect_tuple().unwrap();

        records.retain(|record| record[column] == value);
    }

    if query.contains_key("ORDER BY") {
        let (column, direction): (&str, &str) = query["ORDER BY"].split_whitespace().collect_tuple().unwrap();

        if records.iter().all(|record| Regex::new(r"^-?\d+\.?\d*$").unwrap().is_match(record[column])) {
            records.sort_by(|a, b| a[column].parse::<f32>().unwrap().partial_cmp(&b[column].parse::<f32>().unwrap()).unwrap());
        } else {
            records.sort_by(|a, b| a[column].partial_cmp(&b[column]).unwrap());
        }

        if direction != "ASC" {
            records.reverse();
        }
    }

    if query["SELECT"] != "*" {
        columns = query["SELECT"].split(", ").collect();
    }

    let mut results: Vec<String> = Vec::new();
    results.push(columns.join(" "));
    for record in records.iter() {
        let result: String = columns.iter().map(|&column| record[column].to_string()).join(" ");
        results.push(result);
    }

    // println!("outputTableWithColumnTitlesNoRowIndexes");
    for result in results {
        println!("{result}");
    }
}
