use std::io;

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
    let expression = input_line.trim_matches('\n').to_string(); // the expression to calculate

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let expression_elements: Vec<String> = Regex::new(r"[\d.]+|[a-z]+").unwrap().find_iter(&expression).map(|c| c.as_str().to_string()).collect();
    let (left_value, right_value): (f32, f32) = (expression_elements[0].parse::<f32>().unwrap(), expression_elements[2].parse::<f32>().unwrap());
    let (left_unit, right_unit): (String, String) = (expression_elements[1].to_string(), expression_elements[3].to_string());

    let mut left_metric: MetricUnit = MetricUnit{value: left_value, unit: left_unit};
    let mut right_metric: MetricUnit = MetricUnit{value: right_value, unit: right_unit};

    let big_unit_metric: &str = if right_metric.is_unit_greater_than(&left_metric) {"right"} else {"left"};
    while left_metric.unit != right_metric.unit {
        match big_unit_metric {
            "right" => right_metric.convert_to_small_unit(),
            "left" => left_metric.convert_to_small_unit(),
            _ => ()
        }
    }

    let result_value: String = Regex::new(r"\.0+$")
        .unwrap()
        .replace(&(left_metric.value + right_metric.value).to_string(), "")
        .to_string();

    let result: String = format!("{result_value}{}", left_metric.unit);

    // println!("1cm");
    println!("{result}");
}

struct MetricUnit {
    value: f32,
    unit: String
}

impl MetricUnit {
    const DIGIT_PRECISION: f32 = 5f32;
    const UNITS: [&'static str; 6] = ["um", "mm", "cm", "dm", "m", "km"];

    fn is_unit_greater_than(&self, other: &MetricUnit) -> bool {
        let self_unit_index: Option<usize> = MetricUnit::UNITS.iter().position(|unit| unit.to_string() == self.unit);
        let other_unit_index: Option<usize> = MetricUnit::UNITS.iter().position(|unit| unit.to_string() == other.unit);

        return other_unit_index < self_unit_index;
    }

    fn convert_to_small_unit(&mut self) {
        let convert_hash: HashMap<&str, HashMap<&str, &str>> = HashMap::from([
            ("km", HashMap::from([("small_unit", "m"), ("rate", "1000")])),
            ("m", HashMap::from([("small_unit", "dm"), ("rate", "10")])),
            ("dm", HashMap::from([("small_unit", "cm"), ("rate", "10")])),
            ("cm", HashMap::from([("small_unit", "mm"), ("rate", "10")])),
            ("mm", HashMap::from([("small_unit", "um"), ("rate", "1000")]))
        ]);

        let adjust_rate: f32 = 10f32.powf(MetricUnit::DIGIT_PRECISION);

        self.value = (self.value * convert_hash[self.unit.as_str()][&"rate"].parse::<f32>().unwrap() * adjust_rate).round() / adjust_rate;
        self.unit = convert_hash[self.unit.as_str()][&"small_unit"].to_string();
    }
}
