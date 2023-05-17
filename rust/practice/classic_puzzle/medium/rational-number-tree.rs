use std::io;

use regex::Regex;
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
    let mut lines: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let fraction_regex: Regex = Regex::new(r"^\d+/\d+$").unwrap();
    let results: Vec<String> = lines.iter().map(|line|
        if fraction_regex.is_match(&line) {
            Fraction::from_string(line.to_string()).to_directions()
        } else {
            Fraction::from_directions(line.to_string()).to_string()
        }
    ).collect();


    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

#[derive (Clone, Copy)]
struct Fraction {
    numerator: i64,
    denominator: i64
}

impl Fraction {
    fn new(numerator: i64, denominator: i64) -> Fraction {
        return Fraction {numerator, denominator};
    }

    fn from_string(num: String) -> Fraction {
        let (numerator, denominator): (&str, &str) = num.split_once("/").unwrap();

        return Fraction::new(
            numerator.parse::<i64>().unwrap(),
            denominator.parse::<i64>().unwrap()
        );
    }

    fn from_directions(directions: String) -> Fraction {
        let mut min_fraction: Fraction = Fraction::new(0, 1);
        let mut target_fraction: Fraction = Fraction::new(1, 1);
        let mut max_fraction: Fraction = Fraction::new(1, 0);

        for direction in directions.chars() {
            if direction == 'L' {
                max_fraction = target_fraction;
            } else {
                min_fraction = target_fraction;
            }

            target_fraction.numerator = min_fraction.numerator + max_fraction.numerator;
            target_fraction.denominator = min_fraction.denominator + max_fraction.denominator;
        }

        return target_fraction;
    }

    fn to_directions(self) -> String {
        let mut min_fraction: Fraction = Fraction::new(0, 1);
        let mut target_fraction: Fraction = Fraction::new(1, 1);
        let mut max_fraction: Fraction = Fraction::new(1, 0);

        let mut result: String = "".to_string();
        while self.not_equal(target_fraction) {
            if self.lt(target_fraction) {
                max_fraction = target_fraction;
                result += "L";
            } else {
                min_fraction = target_fraction;
                result += "R";
            }

            target_fraction.numerator = min_fraction.numerator + max_fraction.numerator;
            target_fraction.denominator = min_fraction.denominator + max_fraction.denominator;
        }

        return result;
    }

    fn not_equal(self, other: Fraction) -> bool {
        return self.to_f64() != other.to_f64();
    }

    fn lt(self, other: Fraction) -> bool {
        return self.to_f64() < other.to_f64();
    }

    fn to_f64(self) -> f64 {
        return self.numerator as f64 / self.denominator as f64;
    }
}

impl fmt::Display for Fraction {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}/{}", self.numerator, self.denominator)
    }
}
