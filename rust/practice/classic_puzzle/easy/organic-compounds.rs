use std::io;

use regex::Regex;

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
    let mut compounds: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let compound = input_line.trim_matches('\n').to_string();
        compounds.push(compound);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut unit_grid: Vec<Vec<Unit>> = Vec::new();
    for compound in compounds.iter() {
        let mut unit_row: Vec<Unit> = Vec::new();
        for unit_element in Regex::new(".{3}").unwrap().find_iter(compound) {
            if unit_element.as_str().starts_with("CH") {
                let inner_union: i32 = unit_element.as_str().chars().nth(2).unwrap().to_string().parse::<i32>().unwrap();
                unit_row.push(Unit{unit_type: "Compound".to_string(), can_union: Some(4 - inner_union), require_size: None});
            } else {
                let size: i32 = if unit_element.as_str().replace(" ", "").is_empty() {
                    0
                } else {
                    unit_element.as_str().replace("(", "").replace(")", "").parse::<i32>().unwrap()
                };
                unit_row.push(Unit{unit_type: "Union".to_string(), can_union: None, require_size: Some(size)});
            }
        }

        unit_grid.push(unit_row);
    }

    for unit_row in unit_grid.iter_mut() {
        unit_row.insert(0, Unit{unit_type: "Union".to_string(), can_union: None, require_size: Some(0)});
        unit_row.push(Unit{unit_type: "Union".to_string(), can_union: None, require_size: Some(0)});
    }
    unit_grid.insert(0, (0..unit_grid.first().unwrap().len()).map(|_| Unit{unit_type: "Union".to_string(), can_union: None, require_size: Some(0)}).collect());
    unit_grid.push((0..unit_grid.first().unwrap().len()).map(|_| Unit{unit_type: "Union".to_string(), can_union: None, require_size: Some(0)}).collect());

    let max_width: usize = unit_grid.iter().map(|unit_row| unit_row.len()).max().unwrap();
    for unit_row in unit_grid.iter_mut() {
        for _ in 0..max_width - unit_row.len() {
            unit_row.push(Unit{unit_type: "Union".to_string(), can_union: None, require_size: Some(0)});
        }
    }

    for row_index in 0..unit_grid.len() {
        for unit_index in 0..unit_grid[row_index].len() {
            if unit_grid[row_index][unit_index].unit_type != "Compound" {
                continue;
            }

            let top_unit_require_size = unit_grid[row_index - 1][unit_index].require_size.unwrap_or(0);
            let left_unit_require_size = unit_grid[row_index][unit_index - 1].require_size.unwrap_or(0);
            let right_unit_require_size = unit_grid[row_index][unit_index + 1].require_size.unwrap_or(0);
            let bottom_unit_require_size = unit_grid[row_index + 1][unit_index].require_size.unwrap_or(0);

            for require_size in [top_unit_require_size, left_unit_require_size, right_unit_require_size, bottom_unit_require_size] {
                let mut unit: &mut Unit = unit_grid.get_mut(row_index).unwrap().get_mut(unit_index).unwrap();
                unit.can_union = Some(unit.can_union.unwrap() - require_size);
            }
        }
    }

    let is_valid = unit_grid
        .iter()
        .flatten()
        .filter(|unit| unit.unit_type == "Compound")
        .all(|compound| compound.can_union.unwrap() == 0);
    let result: &str = if is_valid { "VALID" } else { "INVALID" };

    // println!("answer");
    println!("{result}");
}

struct Unit {
    unit_type: String,
    can_union: Option<i32>,
    require_size: Option<i32>
}
