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
    let h = parse_input!(input_line, i32);
    let mut ss: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let s = input_line.trim_matches('\n').to_string();
        ss.push(s);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let grid: Vec<Vec<String>> = ss
        .iter()
        .map(|s| s.chars().map(|c| c.to_string()).collect())
        .collect();

    let result: &str = if is_stable(grid) {
        "STABLE"
    } else {
        "UNSTABLE"
    };

    // println!("UNSTABLE");
    println!("{result}");
}

fn is_stable(grid: Vec<Vec<String>>) -> bool {
    let left_part: &str = "/";
    let right_part: &str = "\\";
    let part_empty: &str = ".";

    let height: usize = grid.len();
    let width: usize = grid.first().unwrap().len();

    for h in 0..height {
        let is_bottom_row: bool = h == height - 1;

        for w in 0..width {
            let card: String = grid[h][w].to_string();
            if card == part_empty {
                continue;
            }

            let is_right_part: bool = card == right_part;

            let mut side_card: Option<String> = None;
            if is_right_part && w != 0 {
                side_card = Some(grid[h][w - 1].to_string());
            } else if w != width - 1 {
                side_card = Some(grid[h][w + 1].to_string());
            }

            let partner_part: &str = if is_right_part {
                left_part
            } else {
                right_part
            };

            let check_side_card: bool = side_card == Some(partner_part.to_string());
            let check_under_card: bool = is_bottom_row || grid[h + 1][w] == partner_part;

            if !check_side_card || !check_under_card {
                return false;
            }
        }
    }

    return true;
}
