use std::io;

use std::fmt;

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
    let x = parse_input!(inputs[0], i32);
    let y = parse_input!(inputs[1], i32);
    let mut rs: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let r = input_line.trim_matches('\n').to_string();
        rs.push(r);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut grid: Vec<Vec<Option<String>>> = Vec::new();
    grid.push(vec![None; w as usize + 2]);
    for r in rs.iter() {
        let mut row: Vec<Option<String>> = r.chars().map(|c| Some(c.to_string())).collect();
        row.insert(0, None);
        row.push(None);

        grid.push(row);
    }
    grid.push(vec![None; w as usize + 2]);

    let mut checked_masses: Vec<String> = Vec::new();
    let mut be_check_masses: Vec<Mass> = vec![Mass{y: y as usize + 1, x: x as usize + 1}];
    let mut exit_masses: Vec<Mass> = Vec::new();
    while !be_check_masses.is_empty() {
        let check_mass: Mass = be_check_masses.remove(0);
        let mass_y: usize = check_mass.y;
        let mass_x: usize = check_mass.x;

        if checked_masses.contains(&check_mass.to_string()) {
            continue;
        }

        checked_masses.push(check_mass.to_string());

        let near_masses: Vec<Mass> = vec![
            Mass{y: mass_y, x: mass_x - 1},
            Mass{y: mass_y - 1, x: mass_x},
            Mass{y: mass_y, x: mass_x + 1},
            Mass{y: mass_y + 1, x: mass_x}
        ];

        for near_mass in near_masses.iter() {
            let mass: Option<&String> = grid[near_mass.y][near_mass.x].as_ref();

            if mass.is_none() {
                exit_masses.push(Mass{y: mass_x - 1, x: mass_y - 1});
            } else if mass.unwrap() == "." {
                be_check_masses.push(Mass{y: near_mass.y, x: near_mass.x});
            }
        }
    }

    exit_masses.sort_by(|a, b| a.y.cmp(&b.y).then(a.x.cmp(&b.x)));
    let results: Vec<String> = exit_masses.iter().map(|exit_mass| exit_mass.to_string()).collect();

    // println!("answer");
    println!("{}", results.len());
    for result in results {
        println!("{result}");
    }
}

struct Mass {
    y: usize,
    x: usize
}

impl fmt::Display for Mass {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{} {}", self.y, self.x)
    }
}
