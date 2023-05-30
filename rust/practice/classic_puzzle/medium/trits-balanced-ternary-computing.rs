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
    let lhs = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let op = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let rhs = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let decimal_lhs: i32 = Balance::new(lhs).to_decimal();
    let decimal_rhs: i32 = Balance::new(rhs).to_decimal();

    let decimal_result: i32 = match op.as_str() {
        "+" => decimal_lhs + decimal_rhs,
        "-" => decimal_lhs - decimal_rhs,
        "*" => decimal_lhs * decimal_rhs,
        "<<" => decimal_lhs * 3i32.pow(decimal_rhs as u32),
        ">>" => decimal_lhs / 3i32.pow(decimal_rhs as u32),
        _ => 0
    };

    let result: String = Balance::from_decimal(decimal_result).value;

    // println!("11T");
    println!("{result}");
}

struct Balance {
    value: String
}

impl Balance {
    fn new(value: String) -> Balance {
        return Balance{value};
    }

    fn from_decimal(decimal: i32) -> Balance {
        let mut temp_decimal: i32 = decimal;

        let mut digits: Vec<String> = Vec::new();
        while temp_decimal != 0 {
            let mut mod_num: String = (temp_decimal % 3).to_string();
            temp_decimal = temp_decimal / 3;

            if mod_num == "2" {
                mod_num = "T".to_string();
                temp_decimal += 1;
            }

            digits.insert(0, mod_num);
        }

        let value: String = if digits.is_empty() {
            "0".to_string()
        } else {
            digits.join("")
        };

        return Balance::new(value);
    }

    fn to_decimal(self) -> i32 {
        let mut result: i32 = 0;
        for (index, c) in self.value.chars().rev().enumerate() {
            let value: i32 = if c == 'T' {
                -1
            } else {
                c.to_string().parse::<i32>().unwrap()
            };

            result += value * 3i32.pow(index as u32);
        }

        return result;
    }
}
