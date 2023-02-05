use std::io;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut texts: Vec<String> = Vec::new();
    for i in 0..6 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let text = input_line.trim_matches('\n').to_string();
        texts.push(text);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let tree: &str = "#";
    let cut_down_tree: &str = "=";
    let empty: &str = "o";
    let fire: &str = "*";

    let mut grid: Vec<Vec<String>> = Vec::new();
    for text in texts.iter() {
        let mut row: Vec<String> = text.chars().map(|c| c.to_string()).collect();
        row.insert(0, empty.to_string());
        row.insert(0, empty.to_string());
        row.push(empty.to_string());
        row.push(empty.to_string());

        grid.push(row);
    }
    grid.insert(0, vec![empty.to_string();grid.first().unwrap().len()]);
    grid.insert(0, vec![empty.to_string();grid.first().unwrap().len()]);
    grid.push(vec![empty.to_string();grid.first().unwrap().len()]);
    grid.push(vec![empty.to_string();grid.first().unwrap().len()]);

    let mut positions: Vec<Position> = Vec::new();
    for (row_index, row) in grid.iter().enumerate() {
        for (value_index, value) in row.iter().enumerate() {
            positions.push(Position{y: row_index, x: value_index, value: value.to_string()});
        }
    }

    let before_tree_size: usize = positions.iter().filter(|position| position.value == tree).count();

    let mut fire_positions: Vec<Position> = Vec::new();
    for index in (0..positions.len()).rev() {
        if positions[index].value == fire {
            fire_positions.push(positions.remove(index));
        }
    }

    for fire_position in fire_positions.iter() {
        for position in positions.iter_mut() {
            if position.value != tree {
                continue;
            }
            if position.y < fire_position.y - 2 || fire_position.y + 2 < position.y {
                continue;
            }
            if position.x < fire_position.x - 2 || fire_position.x + 2 < position.x {
                continue;
            }

            position.value = cut_down_tree.to_string();
        }
    }

    let after_tree_size: usize = positions.iter().filter(|position| position.value == tree).count();

    let result: String = if fire_positions.is_empty() {
        "RELAX".to_string()
    } else if after_tree_size == 0 {
        "JUST RUN".to_string()
    } else {
        (before_tree_size - after_tree_size).to_string()
    };

    // println!("12");
    println!("{result}");
}

struct Position {
    y: usize,
    x: usize,
    value: String
}
