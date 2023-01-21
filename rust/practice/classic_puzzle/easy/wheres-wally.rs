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
    let wally_width = parse_input!(inputs[0], i32);
    let wally_height = parse_input!(inputs[1], i32);
    let mut wally_rows: Vec<String> = Vec::new();
    for i in 0..wally_height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let wally_row = input_line.trim_matches('\n').to_string();
        wally_rows.push(wally_row);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let picture_width = parse_input!(inputs[0], i32);
    let picture_height = parse_input!(inputs[1], i32);
    let mut picture_rows: Vec<String> = Vec::new();
    for i in 0..picture_height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let picture_row = input_line.trim_matches('\n').to_string();
        picture_rows.push(picture_row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let wally: String = wally_rows.join("");

    let wally_indexes: Vec<usize> = wally
        .chars()
        .enumerate()
        .filter(|(_, char)| char != &' ')
        .map(|(index, _)| index)
        .collect();
    let wally_chars: String = wally.replace(" ", "");

    let picture_grid: Vec<Vec<String>> = picture_rows
        .iter()
        .map(|picture_row| picture_row.chars().map(|c| c.to_string()).collect())
        .collect();

    let mut result: Option<String> = None;
    for h in 0..(picture_height - wally_height + 1) as usize {
        for w in 0..(picture_width - wally_width + 1) as usize {
            let temp_picture_chars: Vec<&String> = picture_grid[h..h + wally_height as usize]
                .iter()
                .map(|picture_row| &picture_row[w..w + wally_width as usize])
                .flatten()
                .collect();

            let picture_chars: String = wally_indexes
                .iter()
                .map(|index| temp_picture_chars[*index].to_string())
                .collect::<Vec<String>>()
                .join("");

            if wally_chars != picture_chars {
                continue;
            }

            result = Some(format!("{w} {h}"));
            break;
        }

        if result.is_some() {
            break;
        }
    }

    // println!("x y");
    println!("{}", result.unwrap());
}
