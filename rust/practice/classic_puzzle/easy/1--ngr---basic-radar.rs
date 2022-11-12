use std::io;

use std::collections::HashMap;

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
    let mut scan_results: Vec<ScanResult> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let plate = inputs[0].trim().to_string();
        let radarname = inputs[1].trim().to_string();
        let timestamp = parse_input!(inputs[2], i64);

        let radarpoint: i64 = radarname.split("-").last().unwrap().to_string().parse::<i64>().unwrap();

        let scan_result: ScanResult = ScanResult {plate, radarpoint, timestamp};
        scan_results.push(scan_result);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    scan_results.sort_by(|a, b| a.plate.cmp(&b.plate).then(a.radarpoint.cmp(&b.radarpoint)));

    let mut scan_results_each_car: HashMap<String, Vec<ScanResult>> = HashMap::new();
    for scan_result in scan_results {
        if !scan_results_each_car.contains_key(&scan_result.plate) {
            scan_results_each_car.insert(scan_result.plate.to_string(), Vec::new());
        }

        scan_results_each_car.get_mut(&scan_result.plate).unwrap().push(scan_result);
    }

    let mut plates: Vec<&String> = scan_results_each_car.keys().collect();
    plates.sort();

    let mut results: Vec<String> = Vec::new();
    for plate in plates {
        let scan_results_for_car: &Vec<ScanResult> = scan_results_each_car.get(plate).unwrap();

        let mut speeds: Vec<i64> = Vec::new();
        for i in 0..scan_results_for_car.len() - 1 {
            let l: &ScanResult = scan_results_for_car.get(i).unwrap();
            let r: &ScanResult = scan_results_for_car.get(i + 1).unwrap();

            let distance: i64 = r.radarpoint - l.radarpoint;
            let time: i64 = r.timestamp - l.timestamp;

            let speed: i64 = (distance as f64 / time as f64 * 1000.0 * 60.0 * 60.0) as i64;
            speeds.push(speed);
        }

        let max_speed: i64 = *speeds.iter().max().unwrap();

        if max_speed > 130 {
            results.push(format!("{plate} {max_speed}"));
        }
    }


    // println!("ticket");
    for result in results {
        println!("{result}");
    }
}

struct ScanResult {
    plate: String,
    radarpoint: i64,
    timestamp: i64
}
