use std::io;

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
    let n = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut numbers: Vec<i32> = n[1..n.len() - 1].split(",").map(|i| i.parse::<i32>().unwrap()).collect();
    numbers.sort();

    let mut results: Vec<String> = Vec::new();
    let mut temp: Vec<i32> = Vec::new();
    while !numbers.is_empty() {
        if temp.is_empty() || temp.last().unwrap() + 1 == *numbers.first().unwrap() {
            temp.push(numbers.remove(0));
        } else {
            results = add_item(results.to_vec(), temp.to_vec());
            temp.clear();
        }
    }

    if !temp.is_empty() {
        results = add_item(results.to_vec(), temp.to_vec());
    }

    let result: String = results.join(",");

    // println!("answer");
    println!("{result}");
}

fn add_item(mut array: Vec<String>, items: Vec<i32>) -> Vec<String> {
    if items.len() >= 3 {
        array.push(format!("{}-{}", items.first().unwrap(), items.last().unwrap()));
    } else {
        array.extend(items.iter().map(|item| item.to_string()));
    }

    return array;
}
