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
    let lon = input_line.trim().to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let lat = input_line.trim().to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut defib_strings: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let defib = input_line.trim_matches('\n').to_string();

        defib_strings.push(defib);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let lon_f32: f32 = lon.replace(",", ".").parse::<f32>().unwrap();
    let lat_f32: f32 = lat.replace(",", ".").parse::<f32>().unwrap();

    let mut defibs: Vec<Defib> = Vec::new();
    for defib_string in defib_strings {
        let defib_elements: Vec<&str> = defib_string.split(";").collect();
        // let id: String = defib_elements[0].to_string();
        let name: String = defib_elements[1].to_string();
        // let address: String = defib_elements[2].to_string();
        // let phone: String = defib_elements[3].to_string();
        let longitude: f32 = defib_elements[4].replace(",", ".").parse::<f32>().unwrap();
        let latitude: f32 = defib_elements[5].replace(",", ".").parse::<f32>().unwrap();

        defibs.push(Defib{ name, longitude, latitude });
    }

    let mut near_defib: &Defib = &defibs[0];
    let mut distance: f32 = 10000.0;
    for defib in defibs.iter() {
        let x: f32 = (lon_f32 - defib.longitude) * f32::cos((defib.latitude + lat_f32) / 2.0);
        let y: f32 = lat_f32 - defib.latitude;
        let d: f32 = f32::sqrt(x.powi(2) + y.powi(2)) * 6371.0;

        if d < distance {
            distance = d;
            near_defib = defib;
        }
    }

    let result: String = near_defib.name.to_string();

    // println!("answer");
    println!("{result}");
}

struct Defib {
    // id: String,
    name: String,
    // address: String,
    // phone: String,
    longitude: f32,
    latitude: f32
}
