use std::io;

use itertools::{Tuples, Itertools};

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
        let line = input_line.trim_matches('\n').to_string(); // One line out of three in the string describing the starting position.
        lines.push(line);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let commands = input_line.trim_matches('\n').to_string(); // The sequence of ULDR-characters describing the steps to perform.

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut dice: Dice = Dice::new(lines.join("").replace(" ", ""));

    dice.walk(commands);

    let result: String = dice.on.to_string();

    // The number on the side you end up on after having performed `commands`.
    // println!("number");
    println!("{result}");
}

struct Dice {
    front: i32,
    left: i32,
    on: i32,
    right: i32,
    opposite: i32,
    behind: i32
}

impl Dice {
    fn new(dice_numbers: String) -> Dice {
        let (front, left, on, right, opposite, behind): (i32, i32, i32, i32, i32, i32) =
            dice_numbers.chars().map(|c| c.to_string().parse::<i32>().unwrap()).collect_tuple().unwrap();

        return Dice{front, left, on, right, opposite, behind};
    }

    fn walk(&mut self, commands: String) {
        for command in commands.chars().map(|c| c.to_string()) {
            if command == "U" {
                self.walk_to_forward();
            } else if command == "D" {
                self.walk_to_backward();
            } else if command == "L" {
                self.walk_to_left();
            } else if command == "R" {
                self.walk_to_right();
            }
        }
    }

    fn walk_to_forward(&mut self) {
        let (temp_opposite, temp_front, temp_behind, temp_on): (i32, i32, i32, i32) =
            (self.opposite, self.front, self.behind, self.on);

        self.front = temp_opposite;
        self.on = temp_front;
        self.opposite = temp_behind;
        self.behind = temp_on;
    }

    fn walk_to_backward(&mut self) {
        let (temp_front, temp_left, temp_on, temp_right, temp_opposite, temp_behind): (i32, i32, i32, i32, i32, i32) =
            (self.front, self.left, self.on, self.right, self.opposite, self.behind);

        self.front = temp_opposite;
        self.left = temp_right;
        self.on = temp_behind;
        self.right = temp_left;
        self.opposite = temp_front;
        self.behind = temp_on;
    }

    fn walk_to_left(&mut self) {
        let (temp_opposite, temp_behind, temp_left, temp_front, temp_right, temp_on): (i32, i32, i32, i32, i32, i32) =
            (self.opposite, self.behind, self.left, self.front, self.right, self.on);

        self.front = temp_opposite;
        self.left = temp_behind;
        self.on = temp_left;
        self.right = temp_front;
        self.opposite = temp_right;
        self.behind = temp_on;
    }

    fn walk_to_right(&mut self) {
        let (temp_opposite, temp_front, temp_right, temp_behind, temp_left, temp_on): (i32, i32, i32, i32, i32, i32) =
            (self.opposite, self.front, self.right, self.behind, self.left, self.on);

        self.front = temp_opposite;
        self.left = temp_front;
        self.on = temp_right;
        self.right = temp_behind;
        self.opposite = temp_left;
        self.behind = temp_on;
    }
}
