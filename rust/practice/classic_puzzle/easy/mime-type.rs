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
    let n = parse_input!(input_line, i32); // Number of elements which make up the association table.
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let q = parse_input!(input_line, i32); // Number Q of file names to be analyzed.
    let mut exts: Vec<String> = Vec::new();
    let mut mts: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let ext = inputs[0].trim().to_string(); // file extension
        let mt = inputs[1].trim().to_string(); // MIME type.

        exts.push(ext);
        mts.push(mt);
    }
    let mut fnames: Vec<String> = Vec::new();
    for i in 0..q as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let fname = input_line.trim_matches('\n').to_string(); // One file name per line.

        fnames.push(fname);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    exts = exts.iter().map(|ext| ext.to_lowercase()).collect();

    let mut results: Vec<String> = Vec::new();
    for fname in fnames {
        let fname_elements: Vec<String> = fname.split(".").map(|name| name.to_lowercase()).collect();
        let ext: String = if fname_elements.len() >= 2 {fname_elements.last().unwrap().to_string()} else {"UNKNOWN".to_string()};

        if exts.contains(&ext) {
            let result: String = mts[exts.iter().position(|e| e == &ext).unwrap()].to_string();
            results.push(result);
        } else {
            results.push("UNKNOWN".to_string());
        }
    }

    // For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
    // println!("UNKNOWN");
    for result in results {
        println!("{result}");
    }
}
