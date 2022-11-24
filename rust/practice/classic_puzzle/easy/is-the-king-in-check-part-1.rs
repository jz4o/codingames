use std::io;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut chess_rows: Vec<String> = Vec::new();
    for i in 0..8 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let chess_row = input_line.trim_matches('\n').to_string();
        chess_rows.push(chess_row);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let enemy_kinds: Vec<String> = ["B", "N", "R", "Q"].iter().map(|s| s.to_string()).collect();

    let chess_board: Vec<Vec<String>> = chess_rows.iter().map(|chess_row| chess_row.split_whitespace().map(|value| value.to_string()).collect()).collect();

    let mut king: Piece = Piece{kind: "".to_string(), row_index: -1, column_index: -1};
    let mut enemy: Piece = Piece{kind: "".to_string(), row_index: -1, column_index: -1};
    for row_index in 0..chess_board.len() {
        let row: Vec<String> = chess_board.get(row_index).unwrap().to_vec();
        for column_index in 0..row.len() {
            let kind: String = row.get(column_index).unwrap().to_string();
            if kind == "K" {
                king = Piece{kind: kind, row_index: row_index as i32, column_index: column_index as i32};
            } else if enemy_kinds.contains(&kind) {
                enemy = Piece{kind, row_index: row_index as i32, column_index: column_index as i32};
            }
        }
    }

    let is_same_row: bool = king.row_index == enemy.row_index;
    let is_same_column: bool = king.column_index == enemy.column_index;
    let is_same_diagonal_line = (king.row_index - enemy.row_index).abs() == (king.column_index - enemy.column_index).abs();

    let is_check: bool =
        if enemy.kind == "B" {
            is_same_diagonal_line
        } else if enemy.kind == "N" {
            !is_same_row && !is_same_column && (king.row_index - enemy.row_index).abs() + (king.column_index - enemy.column_index).abs() == 3
        } else if enemy.kind == "R" {
            is_same_row || is_same_column
        } else if enemy.kind == "Q" {
            is_same_row || is_same_column || is_same_diagonal_line
        } else {
            false
        };

    let result: String = if is_check {"Check".to_string()} else {"No Check".to_string()};

    // println!("Check/No Check");
    println!("{result}");
}

struct Piece {
    kind: String,
    row_index: i32,
    column_index: i32
}
