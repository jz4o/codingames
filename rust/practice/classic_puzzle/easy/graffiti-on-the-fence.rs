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
    let l = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut reports: Vec<Report> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let st = parse_input!(inputs[0], i32);
        let ed = parse_input!(inputs[1], i32);

        reports.push(Report{ st, ed })
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    reports.sort_by(|l, r| l.st.partial_cmp(&r.st).unwrap());

    let mut results: Vec<String> = Vec::new();

    let mut position: i32 = 0;
    for report in reports {
        if position < report.st {
            results.push(format!("{position} {}", report.st));
        }

        if position < report.ed {
            position = report.ed;
        }
    }

    if position < l {
        results.push(format!("{position} {l}"));
    }

    if results.len() <= 0 {
        results.push("All painted".to_string());
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Report {
    st: i32,
    ed: i32
}
