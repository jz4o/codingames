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
    let n = parse_input!(input_line, i32);
    let mut planets: Vec<Planet> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let name = inputs[0].trim().to_string();
        let r = inputs[1].trim().to_string();
        let m = inputs[2].trim().to_string();
        let c = inputs[3].trim().to_string();

        planets.push(Planet{
            name: name,
            r: r.parse::<f64>().unwrap(),
            m: m.parse::<f64>().unwrap(),
            c: c.parse::<f64>().unwrap()
        });
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let alice_index: usize = planets.iter().position(|planet| planet.name == "Alice").unwrap();
    let alice: Planet = planets.remove(alice_index);

    let ra: f64 = alice.r;
    let va: f64 = 4.0 / 3.0 * std::f64::consts::PI * ra.powi(3);
    let da: f64 = alice.m / va;

    let mut closest_planet: Planet = Planet{name: "".to_string(), r: 0.0, m: 0.0, c: 0.0};

    planets.sort_by(|a, b| a.c.partial_cmp(&b.c).unwrap());
    for planet in planets {
        let rp: f64 = planet.r;
        let vp: f64 = 4.0 / 3.0 * std::f64::consts::PI * rp.powi(3);
        let dp: f64 = planet.m / vp;

        let roche_limit: f64 = ra * (2.0 * da / dp).cbrt();

        if roche_limit < planet.c {
            closest_planet = planet;
            break;
        }
    }

    let result: String = closest_planet.name;

    // println!("answer");
    println!("{result}");
}

struct Planet {
    name: String,
    r: f64,
    m: f64,
    c: f64
}
