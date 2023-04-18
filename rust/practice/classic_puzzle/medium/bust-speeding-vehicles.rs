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
    let l = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut rs: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let r = input_line.trim_matches('\n').to_string();
        rs.push(r);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut records: Vec<Record> = Vec::new();
    for r in rs.iter() {
        let (number, distance, timestamp): (&str, &str, &str) = r.split_whitespace().collect_tuple().unwrap();

        let record: Record = Record{
            number: number.to_string(),
            distance: distance.parse::<i32>().unwrap(),
            timestamp: timestamp.parse::<i32>().unwrap()
        };

        records.push(record);
    }

    let mut results: Vec<String> = Vec::new();
    for (l_record, r_record) in records[..records.len() - 1].iter().zip(records[1..].iter()) {
        if l_record.number != r_record.number {
            continue;
        }

        let time: i32 = r_record.timestamp - l_record.timestamp;
        let distance: i32 = r_record.distance - l_record.distance;

        let speed: f32 = distance as f32 / (time as f32 / 60f32 / 60f32);
        if speed <= l as f32 {
            continue;
        }

        let result: String = format!("{} {}", r_record.number, r_record.distance);
        results.push(result);
    }

    if results.is_empty() {
        results.push("OK".to_string());
    }

    // println!("result");
    for result in results {
        println!("{result}");
    }
}

struct Record {
    number: String,
    distance: i32,
    timestamp: i32
}
