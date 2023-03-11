use std::io;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Don't let the machines win. You are humanity's last hope...
 **/
fn main() {
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let width = parse_input!(input_line, i32); // the number of cells on the X axis
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let height = parse_input!(input_line, i32); // the number of cells on the Y axis
    let mut lines: Vec<String> = Vec::new();
    for i in 0..height as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string(); // width characters, each either 0 or .
        lines.push(line);
    }

    // Write an action using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();
    for h in 0..height as usize {
        for w in 0..width as usize {
            if lines[h].chars().nth(w).unwrap() == '.' {
                continue;
            }

            let mut result: String = format!("{w} {h} ");

            for r in w + 1..width as usize + 1 {
                if lines[h].len() <= r {
                    result += "-1 -1 ";
                    break;
                } else if lines[h].chars().nth(r).unwrap() == '0' {
                    result += &format!("{r} {h} ");
                    break;
                }
            }

            for b in h + 1..height as usize + 1 {
                if lines.len() <= b {
                    result += "-1 -1 ";
                    break;
                } else if lines[b].chars().nth(w).unwrap() == '0' {
                    result += &format!("{w} {b}");
                    break;
                }
            }

            results.push(result);
        }
    }

    // Three coordinates: a node, its right neighbor, its bottom neighbor
    // println!("0 0 1 0 0 1");
    for result in results {
        println!("{result}");
    }
}
