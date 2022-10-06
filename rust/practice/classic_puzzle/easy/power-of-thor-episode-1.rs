use std::io;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 * ---
 * Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.
 **/
fn main() {
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let light_x = parse_input!(inputs[0], i32); // the X position of the light of power
    let light_y = parse_input!(inputs[1], i32); // the Y position of the light of power
    let initial_tx = parse_input!(inputs[2], i32); // Thor's starting X position
    let initial_ty = parse_input!(inputs[3], i32); // Thor's starting Y position

    let mut tx: i32 = initial_tx;
    let mut ty: i32 = initial_ty;

    // game loop
    loop {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let remaining_turns = parse_input!(input_line, i32); // The remaining amount of turns Thor can move. Do not remove this line.

        // Write an action using println!("message...");
        // To debug: eprintln!("Debug message...");

        let mut move_x: &str = "";
        let mut move_y: &str = "";

        if light_x < tx {
            move_x = "W";
            tx -= 1;
        } else if tx < light_x {
            move_x = "E";
            tx += 1;
        }

        if light_y < ty {
            move_y = "N";
            ty -= 1;
        } else if ty < light_y {
            move_y = "S";
            ty += 1;
        }

        let result: String = move_y.to_owned() + move_x;

        // A single line providing the move to be made: N NE E SE S SW W or NW
        // println!("SE");
        println!("{result}");
    }
}
