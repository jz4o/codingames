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
    let n = parse_input!(input_line, i32); // the number of cards for player 1
    let mut cardp_1_vec: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let cardp_1 = input_line.trim().to_string(); // the n cards of player 1
        cardp_1_vec.push(cardp_1);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let m = parse_input!(input_line, i32); // the number of cards for player 2
    let mut cardp_2_vec: Vec<String> = Vec::new();
    for i in 0..m as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let cardp_2 = input_line.trim().to_string(); // the m cards of player 2
        cardp_2_vec.push(cardp_2);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const CARD_LANKS: [&str;13] = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"];

    let mut deck1: Vec<usize> = cardp_1_vec
        .iter()
        .map(|cardp_1| CARD_LANKS.iter().position(|card_lank| card_lank.to_string() == cardp_1[..cardp_1.len() - 1].to_string()).unwrap())
        .collect();
    let mut deck2: Vec<usize> = cardp_2_vec
        .iter()
        .map(|cardp_2| CARD_LANKS.iter().position(|card_lank| card_lank.to_string() == cardp_2[..cardp_2.len() - 1].to_string()).unwrap())
        .collect();

    let mut turn: usize = 0;
    while !deck1.is_empty() && !deck2.is_empty() {
        turn += 1;

        let fight_result: FightResult = fight(deck1.to_vec(), deck2.to_vec(), 0);
        if fight_result.winner.is_none() {
            deck1.clear();
            deck2.clear();

            break;
        }

        let mut move_cards: Vec<usize> = Vec::new();
        move_cards.extend(deck1[..(fight_result.index as usize + 1)].to_vec());
        move_cards.extend(deck2[..(fight_result.index as usize + 1)].to_vec());

        deck1 = deck1[fight_result.index as usize + 1..].to_vec();
        deck2 = deck2[fight_result.index as usize + 1..].to_vec();

        if fight_result.winner.unwrap() == "deck1" {
            deck1.extend(move_cards);
        } else {
            deck2.extend(move_cards);
        }
    }

    let result: String = if !deck1.is_empty() {
        format!("1 {turn}")
    } else if !deck2.is_empty() {
        format!("2 {turn}")
    } else {
        "PAT".to_string()
    };

    // println!("PAT");
    println!("{result}");
}

struct FightResult {
    winner: Option<String>,
    index: i32
}

fn fight(deck1: Vec<usize>, deck2: Vec<usize>, index: usize) -> FightResult {
    if deck1.len() <= index || deck2.len() <= index {
        return FightResult{winner: None, index: -1};
    }

    let deck1_card: usize = deck1[index];
    let deck2_card: usize = deck2[index];

    return if deck2_card < deck1_card {
        FightResult{winner: Some("deck1".to_string()), index: index as i32}
    } else if deck1_card < deck2_card {
        FightResult{winner: Some("deck2".to_string()), index: index as i32}
    } else {
        fight(deck1, deck2, index + 4)
    };
}
