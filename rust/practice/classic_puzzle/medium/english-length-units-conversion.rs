use std::io;

use itertools::Itertools;
use regex::Captures;
use regex::Regex;
use std::collections::HashMap;

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
    let toconvert = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut relations: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let relation = input_line.trim_matches('\n').to_string();
        relations.push(relation);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let (from_unit, to_unit): (&str, &str) = toconvert.split(" in ").collect_tuple().unwrap();

    let mut relation_hash: HashMap<String, Vec<String>> = HashMap::new();
    let mut relation_rates: HashMap<String, Fraction> = HashMap::new();
    let relation_regex: Regex = Regex::new(r"(\d+)\s(.*)\s=\s(\d+)\s(.*)").unwrap();
    for relation in relations.iter() {
        let captures: Captures = relation_regex.captures(relation).unwrap();
        let l_size: i32 = captures.get(1).unwrap().as_str().parse::<i32>().unwrap();
        let l_unit: String = captures.get(2).unwrap().as_str().to_string();
        let r_size: i32 = captures.get(3).unwrap().as_str().parse::<i32>().unwrap();
        let r_unit: String = captures.get(4).unwrap().as_str().to_string();

        if !relation_hash.contains_key(&l_unit) {
            relation_hash.insert(l_unit.to_string(), Vec::new());
        }
        relation_hash.get_mut(&l_unit).unwrap().push(r_unit.to_string());

        if !relation_hash.contains_key(&r_unit) {
            relation_hash.insert(r_unit.to_string(), Vec::new());
        }
        relation_hash.get_mut(&r_unit).unwrap().push(l_unit.to_string());

        relation_rates.insert(format!("{l_unit}->{r_unit}"), Fraction{numerator: r_size, denominator: l_size});
        relation_rates.insert(format!("{r_unit}->{l_unit}"), Fraction{numerator: l_size, denominator: r_size});
    }

    let mut temp_relation_patterns: Vec<Vec<String>> = vec![vec![from_unit.to_string()]];
    let mut convert_relations: Vec<String> = Vec::new();
    while convert_relations.is_empty() && !temp_relation_patterns.is_empty() {
        let temp_relation_pattern: Vec<String> = temp_relation_patterns.pop().unwrap();

        let unit: String = temp_relation_pattern.last().unwrap().to_string();

        for converted_unit in relation_hash[&unit].iter() {
            if converted_unit == to_unit {
                convert_relations = [temp_relation_pattern.to_vec(), vec![converted_unit.to_string()]].concat();
                break;
            }

            if !temp_relation_pattern.contains(converted_unit) {
                temp_relation_patterns.push([temp_relation_pattern.to_vec(), vec![converted_unit.to_string()]].concat());
            }
        }
    }

    let mut to_fraction: Fraction = Fraction::from(1);
    for (f, t) in convert_relations[..convert_relations.len() - 1].iter().zip(convert_relations[1..].iter()) {
        to_fraction = to_fraction.mult(&relation_rates[&format!("{f}->{t}")]);
    }

    let from_size: i32 = to_fraction.denominator;
    let to_size: i32 = to_fraction.numerator;

    let result: String = format!("{from_size} {from_unit} = {to_size} {to_unit}");

    // println!("result");
    println!("{result}");
}

fn gcd(a: i32, b: i32) -> i32 {
    let min: i32 = std::cmp::min(a, b);
    let max: i32 = std::cmp::max(a, b);

    if min == 0 {
        return max;
    }

    return gcd(min, max % min);
}

struct Fraction {
    numerator: i32,
    denominator: i32
}

impl Fraction {
    fn from(numerator: i32) -> Fraction {
        return Fraction{numerator: numerator, denominator: 1};
    }

    fn mult(self, other: &Fraction) -> Fraction {
        let mut numerator: i32 = self.numerator * other.numerator;
        let mut denominator: i32 = self.denominator * other.denominator;

        let gcd_num: i32 = gcd(numerator, denominator);

        numerator /= gcd_num;
        denominator /= gcd_num;

        return Fraction{numerator, denominator};
    }
}
