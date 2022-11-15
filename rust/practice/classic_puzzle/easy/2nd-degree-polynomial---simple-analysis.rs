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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let a = parse_input!(inputs[0], f64);
    let b = parse_input!(inputs[1], f64);
    let c = parse_input!(inputs[2], f64);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let delta: f64 = b.powi(2) - (4.0 * a * c);

    let mut points: Vec<Point> = Vec::new();

    // x axis
    if a != 0.0 || b != 0.0 {
        if a == 0.0 {
            points.push(Point{x: c * -1.0 / b, y: 0.0});
        } else if delta == 0.0 {
            points.push(Point{x: b * -1.0 / (2.0 * a), y: 0.0});
        } else if delta > 0.0 {
            points.push(Point{x: (b * -1.0 + delta.sqrt()) / (2.0 * a), y: 0.0});
            points.push(Point{x: (b * -1.0 - delta.sqrt()) / (2.0 * a), y: 0.0});
        }
    }

    // y axis
    points.push(Point{x: 0.0, y: c});

    points.sort_by(|a, b| a.x.partial_cmp(&b.x).unwrap().then(a.y.partial_cmp(&b.y).unwrap()));
    let result: String = points.iter().map(|point| point.to_string()).collect::<Vec<String>>().join(",");

    // println!("(X1,Y1),...,(Xn,Yn)");
    println!("{result}");
}

struct Point {
    x: f64,
    y: f64
}

impl Point {
    const DECIMALS_DIGITS: i32 = 2;

    fn formatted_x(&self) -> String {
        let digit_adjust: f64 = 10.0f64.powi(Point::DECIMALS_DIGITS);
        let result: String = ((self.x * digit_adjust).round() / digit_adjust).to_string();

        return result;
    }

    fn formatted_y(&self) -> String {
        let digit_adjust: f64 = 10.0f64.powi(Point::DECIMALS_DIGITS);
        let result: String = ((self.y * digit_adjust).round() / digit_adjust).to_string();

        return result;
    }
}

impl fmt::Display for Point {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({},{})", self.formatted_x(), self.formatted_y())
    }
}
