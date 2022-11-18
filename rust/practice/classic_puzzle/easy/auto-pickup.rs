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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let packet = input_line.trim().to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut temp_packet: String = packet.to_string();

    let mut packets: Vec<Packet> = Vec::new();
    while temp_packet.len() > 0 {
        let instruction_id: String = temp_packet[0..3].to_string();
        let packet_length: String = temp_packet[3..7].to_string();
        let decimal_packet_length: i32 = i32::from_str_radix(&packet_length, 2).unwrap();
        let packet_info: String = temp_packet[7..7 + decimal_packet_length as usize].to_string();

        temp_packet = temp_packet[7 + decimal_packet_length as usize..temp_packet.len() ].to_string();

        packets.push(Packet{instruction_id, packet_length, packet_info});
    }

    let result: String = packets
        .iter()
        .filter(|p| p.instruction_id == "101")
        .map(|p| format!("001{}{}", p.packet_length, p.packet_info))
        .collect::<Vec<String>>()
        .join("");

    // println!("001[length][item id]");
    println!("{result}");
}

struct Packet {
    instruction_id: String,
    packet_length: String,
    packet_info: String
}
