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
    let a = parse_input!(inputs[1], i32);
    let b = parse_input!(inputs[2], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let k = parse_input!(input_line, i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut nums: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let num = parse_input!(i, i32);
        nums.push(num);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();
    for i in a..b + 1 {
        let mut is_buzzle: bool = false;

        // level 1
        // is_buzzle |= i.to_string().ends_with("7");
        // is_buzzle |= (i % 7) == 0;

        // level 2
        // let mut temp_i: i32 = i;
        // loop {
        //     is_buzzle |= temp_i.to_string().ends_with("7");
        //     is_buzzle |= (temp_i % 7) == 0;

        //     let t: i32 = temp_i;
        //     temp_i = temp_i.to_string().chars().map(|c| c.to_string().parse().unwrap()).collect::<Vec<i32>>().iter().sum();

        //     if temp_i == t {
        //         break;
        //     }
        // }

        // level 3
        // let mut temp_i: i32 = i;
        // loop {
        //     let str_temp_i: String = temp_i.to_string();
        //     for num in nums.iter() {
        //         is_buzzle |= str_temp_i.ends_with(&num.to_string());
        //         is_buzzle |= temp_i % num == 0;

        //         if is_buzzle {
        //             break;
        //         }
        //     }

        //     let t: i32 = temp_i;
        //     temp_i = temp_i.to_string().chars().map(|c| c.to_string().parse().unwrap()).collect::<Vec<i32>>().iter().sum();

        //     if temp_i == t {
        //         break;
        //     }
        // }

        // level 4
        let mut temp_i: i32 = i;
        loop {
            let str_temp_i: String = to_nbase_str(temp_i, n);
            for num in nums.iter() {
                is_buzzle |= str_temp_i.ends_with(&to_nbase_str(*num, n));
                is_buzzle |= temp_i % num == 0;

                if is_buzzle {
                    break;
                }
            }

            let t: i32 = temp_i;
            temp_i = str_temp_i.chars().map(|c| c.to_digit(n as u32).unwrap() as i32).collect::<Vec<i32>>().iter().sum();

            if temp_i == t {
                break;
            }
        }

        results.push(if is_buzzle { "Buzzle".to_string() } else { i.to_string() });
    }

    // println!("Buzzle");
    for result in results {
        println!("{result}");
    }
}

fn to_nbase_str(digit: i32, base: i32) -> String {
    let mut result: String = "".to_string();

    let mut d: i32 = digit;
    while d > 0 {
        let mod_num: u32 = (d % base) as u32;

        result = std::char::from_digit(mod_num, base as u32).unwrap().to_string() + &result;
        d = d / base;
    }

    if result.len() == 0 {
        result = "0".to_string();
    }

    return result;
}
