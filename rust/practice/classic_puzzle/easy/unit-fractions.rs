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
    let n = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();
    for y in n + 1..n * 2 + 1 {
        let lcm_num: i64 = lcm(n as i64, y as i64);

        let n_numerator: i64 = lcm_num / n as i64;
        let y_numerator: i64 = lcm_num / y as i64;
        let x_numerator: i64 = n_numerator - y_numerator;

        if x_numerator == 0 || lcm_num % x_numerator != 0 {
            continue;
        }

        let x: i64 = lcm_num / x_numerator;

        results.push(format!("1/{} = 1/{} + 1/{}", n, x, y));
    }

    // println!("1/n = 1/x + 1/y");
    for result in results {
        println!("{result}");
    }
}

fn gcd(a: i64, b: i64) -> i64 {
    let min: i64 = std::cmp::min(a, b);
    let max: i64 = std::cmp::max(a, b);

    if min == 0 {
        return max;
    }

    return gcd(min, max % min);
}

fn lcm(a: i64, b: i64) -> i64 {
    return a / gcd(a, b) * b;
}
