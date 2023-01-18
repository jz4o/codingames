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
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let start_row = parse_input!(inputs[0], i32);
    let start_col = parse_input!(inputs[1], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut map_rows: Vec<String> = Vec::new();
    for i in 0..n as usize {
        for j in 0..h as usize {
            let mut input_line = String::new();
            io::stdin().read_line(&mut input_line).unwrap();
            let map_row = input_line.trim_matches('\n').to_string();
            map_rows.push(map_row);
        }
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const EMPTY: &str = ".";
    const TREASURE: &str = "T";

    let mut maps: Vec<Vec<Vec<String>>> = Vec::new();
    for i in 0..n as usize {
        let mut map: Vec<Vec<String>> = Vec::new();
        for row in map_rows[i * h as usize..(i + 1) * h as usize].iter() {
            map.push(row.chars().map(|c| c.to_string()).collect());
        }

        maps.push(map);
    }

    for map in maps.iter_mut() {
        for row in map.iter_mut() {
            row.insert(0, EMPTY.to_string());
            row.push(EMPTY.to_string());
        }
        map.insert(0, vec![EMPTY.to_string();w as usize + 2]);
        map.push(vec![EMPTY.to_string();w as usize + 2]);
    }

    let mut glory_maps: Vec<GloryMap> = Vec::new();
    for (index, map) in maps.iter_mut().enumerate() {
        let mut current_row: usize = start_row as usize + 1;
        let mut current_col: usize = start_col as usize + 1;
        let mut current: String;

        let mut path_count: usize = 0;
        loop {
            current = map[current_row][current_col].to_string();
            map.get_mut(current_row).unwrap()[current_col] = EMPTY.to_string(); // measures for loop

            path_count += 1;

            match current.as_str() {
                "^" => current_row -= 1,
                "v" => current_row += 1,
                "<" => current_col -= 1,
                ">" => current_col += 1,
                _ => break
            };
        }

        if current != TREASURE {
            continue;
        }

        glory_maps.push(GloryMap {index, path_count});
    }

    glory_maps.sort_by(|a, b| a.path_count.partial_cmp(&b.path_count).unwrap());

    let result: String = if glory_maps.is_empty() {
        "TRAP".to_string()
     } else {
        glory_maps.first().unwrap().index.to_string()
    };

    // println!("mapIndex");
    println!("{result}");
}

struct GloryMap {
    index: usize,
    path_count: usize
}
