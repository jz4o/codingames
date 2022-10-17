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

    let result: i32 = derived_number(n);

    // println!("n_prime");
    println!("{result}");
}

fn prime_division(number: i32) -> Vec<i32> {
    let mut result: Vec<i32> = Vec::new();

    let mut temp_number: i32 = number;
    while temp_number % 2 == 0 {
        result.push(2);
        temp_number /= 2;
    }

    let mut i: i32 = 3;
    while temp_number != 1 {
        if temp_number % i == 0 {
            result.push(i);
            temp_number /= i;
        } else {
            i += 2;
        }
    }

    return result;
}

fn is_prime(number: i32) -> bool {
    for i in 2..number {
        if number % i == 0 {
            return false;
        }
    }

    return true;
}

fn derived_number(number: i32) -> i32 {
    if is_prime(number) {
        return 1;
    }

    let max_prime: i32 = *prime_division(number).iter().max().unwrap();
    let mod_num: i32 = number / max_prime;

    return mod_num + (max_prime * derived_number(mod_num));
}

