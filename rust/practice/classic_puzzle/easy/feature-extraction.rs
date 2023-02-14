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
    let r = parse_input!(inputs[0], i32);
    let c = parse_input!(inputs[1], i32);
    let mut pixel_grid: Vec<Vec<i32>> = Vec::new();
    for i in 0..r as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut pixel_row: Vec<i32> = Vec::new();
        for j in inputs.split_whitespace() {
            let pixel = parse_input!(j, i32);
            pixel_row.push(pixel);
        }
        pixel_grid.push(pixel_row);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let m = parse_input!(inputs[0], i32);
    let n = parse_input!(inputs[1], i32);
    let mut weight_values: Vec<i32> = Vec::new();
    for i in 0..m as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        for j in inputs.split_whitespace() {
            let weight = parse_input!(j, i32);

            weight_values.push(weight);
        }
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut convolution_grid: Vec<Vec<String>> = Vec::new();
    for h in 0..(r as usize - m as usize + 1) {
        let mut convolution_row: Vec<String> = Vec::new();
        for w in 0..(c as usize - n as usize + 1) {
            let mut pixel_values: Vec<i32> = Vec::new();
            for ph in h..h + m as usize {
                for pw in w..w + n as usize {
                    pixel_values.push(pixel_grid[ph][pw]);
                }
            }

            let convolution_value: i32 = pixel_values
                .iter()
                .zip(weight_values.iter())
                .map(|(pixel, weight)| pixel * weight)
                .sum::<i32>();

            convolution_row.push(convolution_value.to_string());;
        }

        convolution_grid.push(convolution_row);
    }

    let results: Vec<String> = convolution_grid
        .iter()
        .map(|convolution_row| convolution_row.join(" "))
        .collect();

    // println!("output matrix");
    for result in results {
        println!("{result}");
    }
}
