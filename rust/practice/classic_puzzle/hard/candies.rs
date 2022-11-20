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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let n = parse_input!(inputs[0], i32);
    let k = parse_input!(inputs[1], i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();

    let mut temps: Vec<Vec<i32>> = (1..k + 1).map(|i| vec![i]).collect::<Vec<Vec<i32>>>();
    while temps.len() > 0 {
        let temp: Vec<i32> = temps.pop().unwrap();
        let temp_sum: i32 = temp.iter().sum::<i32>();

        if temp_sum == n {
            let result: String = temp.iter().map(|t| t.to_string()).collect::<Vec<String>>().join(" ");
            results.insert(0, result);
        } else if temp_sum < n {
            for i in 1..k + 1 {
                let mut new_temp: Vec<i32> = temp.to_vec();
                new_temp.push(i);

                temps.push(new_temp);
            }
        }
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
