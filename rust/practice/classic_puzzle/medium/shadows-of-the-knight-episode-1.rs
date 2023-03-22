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
    let w = parse_input!(inputs[0], i32); // width of the building.
    let h = parse_input!(inputs[1], i32); // height of the building.
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32); // maximum number of turns before game over.
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let x0 = parse_input!(inputs[0], i32);
    let y0 = parse_input!(inputs[1], i32);

    let mut bomb_min_height: i32 = h;
    let mut bomb_max_height: i32 = 0;
    let mut bomb_min_width: i32 = 0; // to left
    let mut bomb_max_width: i32 = w; // to right

    let mut temp_x0: i32 = x0;
    let mut temp_y0: i32 = y0;

    // game loop
    loop {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let bomb_dir = input_line.trim().to_string(); // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

        // Write an action using println!("message...");
        // To debug: eprintln!("Debug message...");

        if bomb_dir.contains("U") {
            bomb_min_height = temp_y0;
            temp_y0 -= ((temp_y0 - bomb_max_height) as f32 / 2f32).ceil() as i32;
        } else if bomb_dir.contains("D") {
            bomb_max_height = temp_y0;
            temp_y0 += ((bomb_min_height - temp_y0) as f32 / 2f32).ceil() as i32;
        }

        if bomb_dir.contains("R") {
            bomb_min_width = temp_x0;
            temp_x0 += ((bomb_max_width - temp_x0) as f32 / 2f32).ceil() as i32;
        } else if bomb_dir.contains("L") {
            bomb_max_width = temp_x0;
            temp_x0 -= ((temp_x0 - bomb_min_width) as f32 / 2f32).ceil() as i32;
        }

        let result: String = format!("{temp_x0} {temp_y0}");

        // the location of the next window Batman should jump to.
        // println!("0 0");
        println!("{result}");
    }
}
