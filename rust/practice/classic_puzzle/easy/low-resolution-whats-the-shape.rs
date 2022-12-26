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
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let pixels: String = rows.join("");
    let points: usize = pixels.chars().filter(|&pixel| pixel == 'X').count()
        + (pixels.chars().filter(|&pixel| pixel != '.' && pixel != 'X').count() / 2);

    let pixel_size: usize = (w * h) as usize;
    let result: &str = if points == pixel_size {
        "Rectangle"
    } else if points > pixel_size / 2 {
        "Ellipse"
    } else {
        "Triangle"
    };

    // println!("Rectangle/Triangle/Ellipse");
    println!("{result}");
}
