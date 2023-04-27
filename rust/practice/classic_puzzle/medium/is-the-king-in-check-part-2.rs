use std::io;

use core::ops::Range;

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

    let chess_board: Vec<Vec<String>> = chess_rows
        .iter()
        .map(|chess_row| chess_row.split_whitespace().map(|s| s.to_string()).collect())
        .collect();

    let enemy_kinds: [&str; 4] = ["B", "N", "R", "Q"];

    let mut temp_king: Option<Piece> = None;
    let mut enemies: Vec<Piece> = Vec::new();
    for (row_index, row) in chess_board.iter().enumerate() {
        for (column_index, kind) in row.iter().enumerate() {
            if kind == "k" {
                temp_king = Some(Piece{kind: kind.to_string(), row: row_index, column: column_index});
            }
            if enemy_kinds.contains(&kind.as_str()) {
                enemies.push(Piece{kind: kind.to_string(), row: row_index, column: column_index});
            }
        }
    }
    let king: Piece = temp_king.unwrap();

    let mut is_check: bool = false;
    for (enemy, another_enemy) in enemies.iter().zip(enemies.iter().rev()) {
        let is_same_row: bool = king.row == enemy.row;
        let is_same_column: bool = king.column == enemy.column;
        let is_same_diagonal_line: bool = king.row.abs_diff(enemy.row) == king.column.abs_diff(enemy.column);

        let is_same_row_another_enemy: bool = king.row == another_enemy.row;
        let is_same_column_another_enemy: bool = king.column == another_enemy.column;
        let is_same_diagonal_line_another_enemy: bool = king.row.abs_diff(another_enemy.row) == king.column.abs_diff(another_enemy.column);

        let range_row_king_and_enemy: Range<usize> = Range {
            start: *[king.row, enemy.row].iter().min().unwrap(),
            end: *[king.row, enemy.row].iter().max().unwrap() + 1
        };
        let range_column_king_and_enemy: Range<usize> = Range {
            start: *[king.column, enemy.column].iter().min().unwrap(),
            end: *[king.column, enemy.column].iter().max().unwrap() + 1
        };

        let is_block_by_another_enemy_in_row: bool = is_same_row_another_enemy
            && range_column_king_and_enemy.contains(&another_enemy.column);
        let is_block_by_another_enemy_in_column: bool = is_same_column_another_enemy
            && range_row_king_and_enemy.contains(&another_enemy.row);
        let is_block_by_another_enemy_in_diagonal_line: bool = is_same_diagonal_line_another_enemy
            && range_row_king_and_enemy.contains(&another_enemy.row)
            && range_column_king_and_enemy.contains(&another_enemy.column);

        let is_check_row: bool = is_same_row && !is_block_by_another_enemy_in_row;
        let is_check_column: bool = is_same_column && !is_block_by_another_enemy_in_column;
        let is_check_diagonal_line: bool = is_same_diagonal_line && !is_block_by_another_enemy_in_diagonal_line;

        is_check = match enemy.kind.as_str() {
            "B" => is_check_diagonal_line,
            "N" => !is_same_row && !is_same_column && king.row.abs_diff(enemy.row) + king.column.abs_diff(enemy.column) == 3,
            "R" => is_check_row || is_check_column,
            "Q" => is_check_row || is_check_column || is_check_diagonal_line,
            _ => is_check
        };

        if is_check {
            break;
        }
    }

    let result: &str = if is_check { "Check" } else { "No Check" };

    // println!("Check/No Check");
    println!("{result}");
}

struct Piece {
    kind: String,
    row: usize,
    column: usize
}
