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
    let mut players: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let player = input_line.trim_matches('\n').to_string();
        players.push(player);
    }
    let mut player_shoots: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let shoots = input_line.trim_matches('\n').to_string();
        player_shoots.push(shoots);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const TARGET_POINT: i32 = 101;
    const MISS_SHOOT: &str = "X";

    let mut reached_rounds: HashMap<String, i32> = HashMap::new();
    for (player, shoots) in players.iter().zip(player_shoots) {
        let mut point: i32 = 0;
        let mut game_round: i32 = 0;

        let mut shoots_vec: Vec<String> = shoots.split_whitespace().map(|s| s.to_string()).collect();
        while !shoots_vec.is_empty() {
            game_round += 1;

            let mut temp_point: i32 = 0;
            let mut temp_shoots: Vec<String> = Vec::new();
            for _ in 0..3 {
                if shoots_vec.is_empty() {
                    break;
                }

                let shoot: String = shoots_vec.remove(0);

                let shoot_point: i32= if shoot.contains("*") {
                    let shoot_elements: Vec<i32> = shoot.split("*").map(|s| s.parse::<i32>().unwrap()).collect();
                    shoot_elements.first().unwrap() * shoot_elements.last().unwrap()
                } else if shoot == MISS_SHOOT {
                    if !temp_shoots.is_empty() && temp_shoots.last().unwrap() == MISS_SHOOT {
                        -30
                    } else {
                        -20
                    }
                } else {
                    shoot.parse::<i32>().unwrap()
                };

                temp_point += shoot_point;

                temp_shoots.push(shoot);

                if TARGET_POINT <= point + temp_point {
                    break;
                }
            }

            if temp_shoots.iter().all(|temp_shoot| temp_shoot == MISS_SHOOT) {
                point = 0;
            } else if point + temp_point <= TARGET_POINT {
                point += temp_point;
            }
        }

        if point == TARGET_POINT {
            reached_rounds.insert(player.to_string(), game_round);
        }
    }

    let min_round: i32 = *reached_rounds.values().min().unwrap();
    let result: String = reached_rounds
        .iter()
        .filter(|(_, &game_round)| game_round == min_round)
        .map(|(player, _)| player.to_string())
        .next()
        .unwrap();

    // println!("winner");
    println!("{result}");
}
