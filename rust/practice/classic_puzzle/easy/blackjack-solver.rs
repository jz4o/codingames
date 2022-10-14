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
    let bank_cards = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let player_cards = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    struct Hand {
        card_points: Vec<i32>,
        point: i32
    }

    impl Hand {
        fn new(cards: String) -> Self {
            let mut card_points: Vec<i32> = Vec::new();
            for card in cards.split_whitespace() {
                let card_point: i32 = if "JQK".contains(card) {
                    10
                } else if card == "A" {
                    1
                } else {
                    card.parse().unwrap()
                };

                card_points.push(card_point);
            }

            let mut point: i32 = card_points.iter().sum::<i32>();
            if card_points.contains(&1i32) && point <= 11 {
                point += 10;
            }
            if point > 21 {
                point = 0;
            }

            return Hand {
                card_points: card_points,
                point: point
            };
        }

        fn is_burst(&self) -> bool {
            return self.point == 0;
        }

        fn is_black_jack(&self) -> bool {
            return self.card_points == [1, 10];
        }
    }

    let bank_hand: Hand = Hand::new(bank_cards);
    let player_hand: Hand = Hand::new(player_cards);

    let result: &str;
    if player_hand.is_black_jack() && !bank_hand.is_black_jack() {
        result = "Blackjack!";
    } else if player_hand.point < bank_hand.point || (bank_hand.is_burst() && player_hand.is_burst()) {
        result = "Bank";
    } else if bank_hand.point < player_hand.point {
        result = "Player";
    } else {
        result = "Draw";
    }

    // println!("Blackjack!");
    println!("{result}");
}
