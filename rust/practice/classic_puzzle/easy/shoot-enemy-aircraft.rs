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
    let n = parse_input!(input_line, i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim().to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let enemy_values: [&str; 2] = [">", "<"];
    let enemies: Vec<Enemy> = lines.iter().enumerate().flat_map(|(row_index, row)| {
        row.chars().map(|c| c.to_string()).enumerate().filter_map(move |(column_index, value)| {
            if enemy_values.contains(&value.as_str()) {
                Some(Enemy { row_index, column_index, _value: value })
            } else {
                None
            }
        })
    }).collect();

    let launcher_value: char = '^';
    let (launcher_row_index, launcher_column_index): (usize, usize) = lines.iter().enumerate().find_map(|(row_index, row)| {
        if !row.contains(launcher_value) {
            return None;
        }

        let launcher_row_index: usize = row_index;
        let launcher_column_index: usize = row.chars().position(|value| value == launcher_value).unwrap();

        Some((launcher_row_index, launcher_column_index))
    }).unwrap();

    let shoot_indexes: Vec<usize> = enemies.iter().map(|enemy| {
        let vertical_diff: usize = launcher_row_index - enemy.row_index;
        let horizontal_diff: usize = launcher_column_index.abs_diff(enemy.column_index);

        return vertical_diff.abs_diff(horizontal_diff) - 1;
    }).collect();

    let max_shoot_index: usize = *shoot_indexes.iter().max().unwrap();
    let results: Vec<&str> = (0..max_shoot_index + 1).map(|index| {
        if shoot_indexes.contains(&index) {
            "SHOOT"
        } else {
            "WAIT"
        }
    }).collect();

    // println!("WAIT");
    // println!("SHOOT");
    for result in results {
        println!("{result}");
    }
}

struct Enemy {
    row_index: usize,
    column_index: usize,
    _value: String
}
