use std::io;

use std::collections::HashMap;

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
    let rook_position = input_line.trim().to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let nb_pieces = parse_input!(input_line, i32);
    let mut input_rows: Vec<(i32, String)> = Vec::new();
    for i in 0..nb_pieces as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let colour = parse_input!(inputs[0], i32);
        let one_piece = inputs[1].trim().to_string();
        input_rows.push((colour, one_piece));
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const BLACK: i32 = 1;

    let mut piece_positions: HashMap<String, HashMap<usize, i32>> = HashMap::new();
    for (colour, one_piece) in input_rows.iter() {
        let piece_elements: Vec<String> = one_piece.chars().map(|c| c.to_string()).collect();
        let column: &String = piece_elements.first().unwrap();
        let row: usize = piece_elements.last().unwrap().parse::<usize>().unwrap();

        if !piece_positions.contains_key(column) {
            piece_positions.insert(column.to_string(), HashMap::new());
        }
        piece_positions.get_mut(column).unwrap().insert(row, *colour);
    }

    let rook_position_elements: Vec<String> = rook_position.chars().map(|c| c.to_string()).collect();
    let rook_column: &String = rook_position_elements.first().unwrap();
    let rook_row: usize = rook_position_elements.last().unwrap().parse::<usize>().unwrap();

    let mut results: Vec<String> = Vec::new();

    // move to top
    for row_num in (1..rook_row).rev() {
        if piece_positions.contains_key(rook_column) && piece_positions[rook_column].contains_key(&row_num) {
            let colour: i32 = piece_positions[rook_column][&row_num];
            if colour == BLACK {
                results.push(format!("R{rook_position}x{rook_column}{row_num}"));
            }
            break;
        }

        results.push(format!("R{rook_position}-{rook_column}{row_num}"));
    }

    // move to bottom
    for row_num in rook_row + 1..9 {
        if piece_positions.contains_key(rook_column) && piece_positions[rook_column].contains_key(&row_num) {
            let colour: i32 = piece_positions[rook_column][&row_num];
            if colour == BLACK {
                results.push(format!("R{rook_position}x{rook_column}{row_num}"));
            }
            break;
        }

        results.push(format!("R{rook_position}-{rook_column}{row_num}"));
    }

    // move to left
    for column in "abcdefgh".chars().rev().map(|c| c.to_string()) {
        if rook_column.chars().nth(0).unwrap() as usize <= column.chars().nth(0).unwrap() as usize {
            continue;
        }

        if piece_positions.contains_key(&column) && piece_positions[&column].contains_key(&rook_row) {
            let colour: i32 = piece_positions[&column][&rook_row];
            if colour == BLACK {
                results.push(format!("R{rook_position}x{column}{rook_row}"));
            }
            break;
        }

        results.push(format!("R{rook_position}-{column}{rook_row}"));
    }

    // move to right
    for column in "abcdefgh".chars().map(|c| c.to_string()) {
        if column.chars().nth(0).unwrap() as usize <= rook_column.chars().nth(0).unwrap() as usize {
            continue;
        }

        if piece_positions.contains_key(&column) && piece_positions[&column].contains_key(&rook_row) {
            let colour: i32 = piece_positions[&column][&rook_row];
            if colour == BLACK {
                results.push(format!("R{rook_position}x{column}{rook_row}"));
            }
            break;
        }

        results.push(format!("R{rook_position}-{column}{rook_row}"));
    }

    results.sort();

    // println!("ANSWER");
    for result in results {
        println!("{result}");
    }
}
