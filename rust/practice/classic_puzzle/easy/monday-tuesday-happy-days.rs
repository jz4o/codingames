use std::io;

use chrono::NaiveDate;

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
    let leap_year = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let source_day_of_week = inputs[0].trim().to_string();
    let source_month = inputs[1].trim().to_string();
    let source_day_of_month = parse_input!(inputs[2], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let target_month = inputs[0].trim().to_string();
    let target_day_of_month = parse_input!(inputs[1], i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const MONTHS: [&str; 13] = ["None", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    const DAY_OF_WEEK: [&str; 7] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

    let year: i32 = if leap_year == 1 { 2000 } else { 1999 };
    let target_date: NaiveDate = NaiveDate::from_ymd(year, MONTHS.iter().position(|&e| e == target_month).unwrap() as u32, target_day_of_month as u32);
    let source_date: NaiveDate = NaiveDate::from_ymd(year, MONTHS.iter().position(|&e| e == source_month).unwrap() as u32, source_day_of_month as u32);

    let days: i64 = (target_date - source_date).num_days();
    let source_day_of_week_index: i64 = DAY_OF_WEEK.iter().position(|&e| e == source_day_of_week).unwrap() as i64;
    let target_day_of_week_index: i64 = if days < 0 {
        (((days as f32 / DAY_OF_WEEK.len() as f32).abs().ceil() as i64 * DAY_OF_WEEK.len() as i64) + days + source_day_of_week_index) % DAY_OF_WEEK.len() as i64
    } else {
        (days + source_day_of_week_index) % DAY_OF_WEEK.len() as i64
    };

    let result: &str = DAY_OF_WEEK[target_day_of_week_index as usize];

    // println!("day of week");
    println!("{result}");
}
