use std::io;

use regex::Regex;
use std::cmp::Ordering;
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
    let expression = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let types = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let expressions: Vec<String> = Regex::new(r"[-+][a-z]+")
        .unwrap()
        .find_iter(&expression)
        .map(|m| m.as_str().to_string())
        .collect();

    let int_expressions: Vec<String> = expressions
        .iter()
        .zip(types.split(","))
        .filter(|(_, t)| t.to_string() == "int".to_string())
        .map(|(express, _)| express[1..].to_string())
        .collect();

    let mut objects: Vec<HashMap<String, String>> = Vec::new();
    for row in rows.iter() {
        let mut object: HashMap<String, String> = HashMap::new();
        for column in row.split(",") {
            let (k, v): (&str, &str) = column.split_once(":").unwrap();
            object.insert(k.to_string(), v.to_string());
        }

        objects.push(object);
    }

    objects.sort_by(|a, b| {
        let mut cmp: Ordering = 0.partial_cmp(&0).unwrap();
        for express in expressions.iter() {
            let is_ascending: bool = express.starts_with("+");
            let column: &String = &express[1..].to_string();

            cmp = if int_expressions.contains(&express[1..].to_string()) {
                if is_ascending {
                    cmp.then(a[column].parse::<i32>().unwrap().partial_cmp(&b[column].parse::<i32>().unwrap()).unwrap())
                } else {
                    cmp.then(b[column].parse::<i32>().unwrap().partial_cmp(&a[column].parse::<i32>().unwrap()).unwrap())
                }
            } else {
                if is_ascending {
                    cmp.then(a[column].partial_cmp(&b[column]).unwrap())
                } else {
                    cmp.then(b[column].partial_cmp(&a[column]).unwrap())
                }
            };
        }

        cmp.then(a["id"].partial_cmp(&b["id"]).unwrap())
    });

    let results: Vec<String> = objects
        .iter()
        .map(|object| object["id"].to_string())
        .collect();

    // println!("answer");
    for result in results.iter() {
        println!("{result}");
    }
}
