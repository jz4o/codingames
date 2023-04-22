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

    let mut is_carmichael: bool = !is_prime(n);
    for prime_factor in prime_division(n) {
        if (n - 1) % (prime_factor - 1) != 0 {
            is_carmichael = false;
            break;
        }
    }

    let result: &str = if is_carmichael { "YES" } else { "NO" };

    // println!("YES|NO");
    println!("{result}");
}

fn prime_division(num: i32) -> Vec<i32> {
    let mut result: Vec<i32> = Vec::new();

    let mut temp_num: i32 = num;
    while temp_num % 2 == 0 {
        result.push(2);
        temp_num /= 2;
    }

    let mut i: i32 = 3;
    while temp_num != 1 {
        if temp_num % i == 0 {
            result.push(i);
            temp_num /= i;
        } else {
            i += 2;
        }
    }

    return result;
}

fn is_prime(num: i32) -> bool {
    let mut i: i32 = 2;
    while i < num {
        if num % i == 0 {
            return false;
        }

        i += 1;
    }

    return true;
}
