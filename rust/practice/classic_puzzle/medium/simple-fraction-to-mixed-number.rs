use std::io;

use std::fmt;

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
    let mut xys: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let x_y = input_line.trim().to_string();
        xys.push(x_y);
    }
    for i in 0..n as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let mut fraction: Fraction = Fraction::from_string(xys[i].to_string());
        if fraction.denominator == 0 {
            println!("DIVISION BY ZERO");
            continue;
        }

        let int: i32 = fraction.numerator / fraction.denominator;
        fraction.numerator = fraction.numerator % fraction.denominator;

        if int < 0 {
            fraction.numerator *= -1;
        }
        let str_int: String = if int == 0 {
            "".to_string()
        } else {
            int.to_string()
        };
        let str_fraction = if fraction.numerator == 0 {
            "".to_string()
        } else {
            fraction.to_string()
        };

        let mut result: String = format!("{str_int} {str_fraction}").trim().to_string();
        if result.is_empty() {
            result = "0".to_string()
        }

        // println!("answer");
        println!("{result}");
    }
}

struct Fraction {
    numerator: i32,
    denominator: i32
}

impl Fraction {
    fn new(numerator: i32, denominator: i32) -> Fraction {
        let mut n: i32 = numerator;
        let mut d: i32 = denominator;
        if d < 0 {
            n *= -1;
            d *= -1;
        }

        let gcd_num: i32 = gcd(n.abs(), d.abs());
        if gcd_num != 0 {
            n /= gcd_num;
            d /= gcd_num;
        }

        return Fraction{numerator: n, denominator: d};
    }

    fn from_string(num: String) -> Fraction {
        let (str_x, str_y): (&str, &str) = num.split_once("/").unwrap();
        let x: i32 = str_x.parse::<i32>().unwrap();
        let y: i32 = str_y.parse::<i32>().unwrap();

        return Fraction::new(x, y);
    }
}

impl fmt::Display for Fraction {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}/{}", self.numerator, self.denominator)
    }
}

fn gcd(a: i32, b: i32) -> i32 {
    let min: i32 = std::cmp::min(a, b);
    let max: i32 = std::cmp::max(a, b);

    if min == 0 {
        return max;
    }

    return gcd(min, max % min);
}
