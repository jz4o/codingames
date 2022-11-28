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
    let s = parse_input!(inputs[0], i32);
    let m = parse_input!(inputs[1], i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut service_maxclients: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let maxclients = parse_input!(i, i32);
        service_maxclients.push(maxclients);
    }
    let mut service_clients: Vec<Vec<i32>> = Vec::new();
    for i in 0..m as usize {
        let mut inputs = String::new();
        io::stdin().read_line(&mut inputs).unwrap();
        let mut service_clients_row: Vec<i32> = Vec::new();
        for j in inputs.split_whitespace() {
            let clients = parse_input!(j, i32);
            service_clients_row.push(clients);
        }
        service_clients.push(service_clients_row);
    }
    let mut temp_instances: Vec<i32> = vec![0;s as usize];
    for i in 0..m as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let service_clients_row: Vec<i32> = service_clients[i].to_vec();

        let instances: Vec<i32> = (0..service_clients_row.len()).map(|index| (service_clients_row[index] as f32 / service_maxclients[index] as f32).ceil() as i32).collect();

        let scalings: Vec<i32> = (0..instances.len()).map(|index| instances[index] - temp_instances[index]).collect();
        temp_instances = instances;

        let result: String = scalings.iter().map(|scaling| scaling.to_string()).collect::<Vec<String>>().join(" ");

        // println!("Number of services to start / stop");
        println!("{result}");
    }
}
