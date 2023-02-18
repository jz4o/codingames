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
    let mut games: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let game = input_line.trim_matches('\n').to_string();
        games.push(game);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut results: Vec<String> = Vec::new();
    for game in games.iter() {
        let mut scores: Vec<Score> = Vec::new();
        for (frame, score) in game.split_whitespace().enumerate() {
            for s in score.chars().map(|c| c.to_string()) {
                scores.push(Score{frame: frame, point: s});
            }
        }

        for index in 0..scores.len() {
            if scores[index].point == "-" {
                scores[index].point = "0".to_string();
            } else if scores[index].point == "/" {
                let bonus_point: i32 = if scores[index].frame < 9 {
                    scores[index + 1].get_int_point()
                } else {
                    0
                };

                scores[index].point = (10 - scores[index - 1].get_int_point() + bonus_point).to_string();
            } else if scores[index].point == "X" {
                let bonus_scores: Vec<&Score> = if scores[index].frame < 9 {
                    scores[index + 1..index + 2 + 1].iter().collect()
                } else {
                    vec![]
                };

                let bonus_point: i32 = if bonus_scores.iter().any(|score| score.point == "/") {
                    10
                } else {
                    bonus_scores.iter().map(|score| score.get_int_point()).sum::<i32>()
                };

                scores[index].point = (10 + bonus_point).to_string()
            }
        }

        let mut score_hash: HashMap<usize, i32> = HashMap::new();
        for score in scores.iter() {
            if !score_hash.contains_key(&score.frame) {
                score_hash.insert(score.frame, 0);
            }

            score_hash.insert(score.frame, score_hash[&score.frame] + score.get_int_point());
        }

        let mut sum_point: i32 = 0;
        let mut frame_sum_points: Vec<i32> = Vec::new();
        for index in 0..score_hash.keys().max().unwrap() + 1 {
            sum_point += score_hash[&index];
            frame_sum_points.push(sum_point);
        }

        let result: String = frame_sum_points.iter().map(|point| point.to_string()).collect::<Vec<String>>().join(" ");

        results.push(result);
    }

    // println!("5 13 18 26 31 32 34 40 47 54");
    for result in results {
        println!("{result}");
    }
}

struct Score {
    frame: usize,
    point: String,
}

impl Score {
    fn get_int_point(&self) -> i32 {
        return self.point.replace("X", "10").replace("-", "0").parse::<i32>().unwrap();
    }
}
