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
    let n = parse_input!(inputs[0], i32);
    let m = parse_input!(inputs[1], i32);
    let c = parse_input!(inputs[2], i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut nxs: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let nx = parse_input!(i, i32);
        nxs.push(nx);
    }
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut mxs: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let mx = parse_input!(i, i32);
        mxs.push(mx);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut devices: Vec<Device> = Vec::new();
    for nx in nxs {
        devices.push(Device::new(nx));
    }
    devices.insert(0, Device::new(0));

    let mut sum_ampere: i32 = 0;
    let mut sum_amperes: Vec<i32> = Vec::new();
    for mx in mxs {
        sum_ampere += devices[mx as usize].switch();
        sum_amperes.push(sum_ampere);
    }

    let mut results: Vec<String> = Vec::new();
    if sum_amperes.iter().max().unwrap() > &c {
        results.push("Fuse was blown.".to_string());
    } else {
        results.push("Fuse was not blown.".to_string());
        results.push(format!("Maximal consumed current was {} A.", sum_amperes.iter().max().unwrap()));
    }

    // println!("Fuse was not blown.");
    // println!("Maximal consumed current was XX A.");
    for result in results {
        println!("{result}");
    }
}

struct Device {
    ampere: i32,
    status: String
}

impl Device {
    fn new(ampere: i32) -> Self {
        return Device { ampere, status: "off".to_string() };
    }

    fn switch(&mut self) -> i32 {
        if self.status == "on".to_string() {
            self.status = "off".to_string();
            return -self.ampere;
        } else {
            self.status = "on".to_string();
            return self.ampere;
        }
    }
}
