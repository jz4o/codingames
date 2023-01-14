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
    let mut players: Vec<Player> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let numplayer = parse_input!(inputs[0], i32);
        let signplayer = inputs[1].trim().to_string();

        players.push(Player{num: numplayer, sign: signplayer, competed_nums: Vec::new()});
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    while players.len() > 1 {
        let mut winners: Vec<Player> = Vec::new();
        while !players.is_empty() {
            let mut left: Player = players.remove(0);
            let mut right: Player = players.remove(0);

            let compete: String = left.compete(&right);
            if compete == "win" || (compete == "draw" && left.num <= right.num) {
                left.competed_nums.push(right.num.to_string());
                winners.push(left);
            } else {
                right.competed_nums.push(left.num.to_string());
                winners.push(right);
            }
        }

        players = winners;
    }

    let winner: &Player = &players[0];

    let mut results: Vec<String> = Vec::new();
    results.push(winner.num.to_string());
    results.push(winner.competed_nums.join(" "));

    // println!("WHO IS THE WINNER?");
    for result in results {
        println!("{result}");
    }
}

struct Player {
    num: i32,
    sign: String,
    competed_nums: Vec<String>
}

impl Player {
    fn compete(&mut self, other: &Player) -> String {
        let decision_table: HashMap<&str, HashMap<&str, &str>> = HashMap::from([
            ("R", HashMap::from([("R", "draw"), ("P", "lose"), ("C", "win"), ("L", "win"), ("S", "lose")])),
            ("P", HashMap::from([("R", "win"), ("P", "draw"), ("C", "lose"), ("L", "lose"), ("S", "win")])),
            ("C", HashMap::from([("R", "lose"), ("P", "win"), ("C", "draw"), ("L", "win"), ("S", "lose")])),
            ("L", HashMap::from([("R", "lose"), ("P", "win"), ("C", "lose"), ("L", "draw"), ("S", "win")])),
            ("S", HashMap::from([("R", "win"), ("P", "lose"), ("C", "win"), ("L", "lose"), ("S", "draw")]))
        ]);

        return decision_table[self.sign.as_str()][other.sign.as_str()].to_string();
    }
}
