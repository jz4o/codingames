use std::io;

use itertools::Itertools;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut lines: Vec<String> = Vec::new();
    for i in 0..3 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string(); // One line out of three in the string describing the arrangement of the numbers.
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let (mut a, mut b, mut c, mut d, mut e, mut f): (i32, i32, i32, i32, i32, i32) =
        lines.join("").replace(" ", "").chars().map(|c| c.to_string().parse::<i32>().unwrap()).collect_tuple().unwrap();

    let is_check_versus_faces: bool = [a + f, b + d, c + e].iter().all(|&sum_value| sum_value == 7);
    let is_check_face_values: bool = [a, b, c, d, e, f].iter().sorted().join("") == "123456";
    let is_not_degenerate: bool = is_check_versus_faces  && is_check_face_values;

    let result: &str;
    if is_not_degenerate {
        let mut is_turn_over: bool = false;
        if a >= 4 {
            (a, f) = (f, a);
            is_turn_over = true;
        }

        if c >= 4 {
            (b, c, d, e) = (d, e, b, c);
        }

        result = if [a, b, c, d, e, f].iter().filter(|&&face| face <= 3).join("").repeat(2).contains("123") == is_turn_over {
            "left-handed"
        } else {
            "right-handed"
        };
    } else {
        result = "degenerate";
    }

    // Output one of "right-handed", "left-handed" and "degenerate".
    // println!("handedness");
    println!("{result}");
}
