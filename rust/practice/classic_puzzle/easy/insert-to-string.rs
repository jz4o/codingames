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
    let s = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let change_count = parse_input!(input_line, i32);
    let mut raw_changes: Vec<String> = Vec::new();
    for i in 0..change_count as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let raw_change = input_line.trim_matches('\n').to_string();
        raw_changes.push(raw_change);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut changes: Vec<Change> = Vec::new();
    for raw_change in raw_changes.iter() {
        let (row_index_str, column_index_str, value): (&str, &str, &str) = raw_change.split("|").collect_tuple().unwrap();

        let row_index: usize = row_index_str.parse::<usize>().unwrap();
        let column_index: usize = column_index_str.parse::<usize>().unwrap();

        changes.push(Change{row_index: row_index, column_index: column_index, value: value.to_string()});
    }

    changes.sort_by(|a, b|
        b.row_index.partial_cmp(&a.row_index).unwrap()
            .then(b.column_index.partial_cmp(&a.column_index).unwrap())
    );

    let mut s_rows: Vec<String> = s.split("\\n").map(|temp_s| temp_s.to_string()).collect();
    for change in changes.iter() {
        let s_row: &str = &s_rows[change.row_index];

        let before: &str = &s_row[..change.column_index];
        let after: &str = &s_row[change.column_index..];
        let value: &str = &change.value;

        s_rows[change.row_index] = format!("{before}{value}{after}");
    }

    let results: Vec<&str> = s_rows.iter().flat_map(|s_row| s_row.split("\\n")).collect();

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Change {
    row_index: usize,
    column_index: usize,
    value: String
}
