use std::io;

use regex::Regex;

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
    let mut keys: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let key = input_line.trim_matches('\n').to_string();
        keys.push(key);
    }
    let mut calculator: Calculator = Calculator::new();
    for i in 0..n as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let key: String = keys[i].to_string();
        calculator.press(key);

        let result: String = calculator.get_display();

        // println!("answer");
        println!("{result}");
    }
}

struct Calculator {
    num1: String,
    operation: String,
    num2: String,
    pressed_equal: bool,
    display: String
}

impl Calculator {
    const DECIMAL_PLACES: i32 = 3;

    fn new() -> Calculator {
        return Calculator{
            num1: "".to_string(),
            operation: "".to_string(),
            num2: "".to_string(),
            pressed_equal: false,
            display: "".to_string()
        };
    }

    fn init(&mut self) {
        *self = Calculator::new();
    }

    fn get_display(&mut self) -> String {
        return self.display.to_string();
    }

    fn press(&mut self, key: String) {
        if "0123456789".contains(&key) {
            if self.pressed_equal {
                self.init();
            }

            if self.operation.is_empty() {
                self.num1 += &key;
                self.display = self.num1.to_string();
            } else {
                self.num2 += &key;
                self.display = self.num2.to_string();
            }
        } else if "+-x/".contains(&key) {
            if !self.num2.is_empty() && !self.pressed_equal {
                self.calc();
            }

            self.operation = key.to_string();

            self.num2 = "".to_string();
            self.pressed_equal = false;

            self.display = self.num1.to_string();
        } else if key == "=" {
            self.pressed_equal = true;

            self.display = self.calc();
        } else if key == "AC" {
            self.init();

            self.display = "0".to_string();
        }
    }

    fn calc(&mut self) -> String {
        let num1: f32 = self.num1.to_string().parse::<f32>().unwrap_or(0f32);
        let num2: f32 = self.num2.to_string().parse::<f32>().unwrap_or(0f32);

        let result: f32 = match self.operation.as_str() {
            "+" => num1 + num2,
            "-" => num1 - num2,
            "x" => num1 * num2,
            "/" => num1 / num2,
            _ => 0f32
        };

        let adjust_num: f32 = 10f32.powi(Calculator::DECIMAL_PLACES);
        let str_result: String = Regex::new(r"\.0$")
            .unwrap()
            .replace(&((result * adjust_num).round() / adjust_num).to_string(), "")
            .to_string();

        self.num1 = str_result;

        return self.num1.to_string();
    }
}
