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
    let mut answer_rows: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let answer = input_line.trim_matches('\n').to_string();
        answer_rows.push(answer);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut answers: Vec<Answer> = Vec::new();
    for answer_row in answer_rows.iter() {
        let answer_elements: Vec<String> = answer_row.split_whitespace().map(|s| s.to_string()).collect();
        let age: i32 = answer_elements.get(0).unwrap().parse::<i32>().unwrap();
        let gender: String = answer_elements.get(1).unwrap().to_string();
        let genre: Option<String> = if answer_elements.get(2).is_some() { Some(answer_elements.get(2).unwrap().to_string()) } else { None };

        answers.push(Answer{age, gender, genre});
    }

    let train_answers: Vec<&Answer> = answers.iter().filter(|answer| answer.genre.is_some()).collect();
    let test_answers: Vec<&Answer> = answers.iter().filter(|answer| answer.genre.is_none()).collect();

    let mut learning_model: HashMap<String, HashMap<String, HashMap<&str, i32>>> = HashMap::new();
    for answer in train_answers.iter() {
        let age: i32 = answer.age;
        let gender: String = answer.gender.to_string();
        let genre: String = answer.genre.as_ref().unwrap().to_string();

        if !learning_model.contains_key(&gender) {
            learning_model.insert(gender.to_string(), HashMap::new());
        }

        if !learning_model[&gender].contains_key(&genre) {
            learning_model.get_mut(&gender).unwrap().insert(genre.to_string(), HashMap::new());
            learning_model.get_mut(&gender).unwrap().get_mut(&genre).unwrap().insert("min", age);
            learning_model.get_mut(&gender).unwrap().get_mut(&genre).unwrap().insert("max", age);
        }

        if age < learning_model[&gender][&genre]["min"] {
            learning_model.get_mut(&gender).unwrap().get_mut(&genre).unwrap().insert("min", age);
        }

        if learning_model[&gender][&genre]["max"] < age {
            learning_model.get_mut(&gender).unwrap().get_mut(&genre).unwrap().insert("max", age);
        }
    }

    let mut results: Vec<String> = Vec::new();
    for answer in test_answers.iter() {
        let age = answer.age;
        let gender = answer.gender.to_string();

        let mut predict: Option<String> = None;
        if learning_model.contains_key(&gender) {
            for (genre, age_hash) in learning_model[&gender].iter() {
                if age_hash["min"] <= age && age <= age_hash["max"] {
                    predict = Some(genre.to_string());
                    break;
                }
            }
        }

        results.push(predict.unwrap_or("None".to_string()));
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

struct Answer {
    age: i32,
    gender: String,
    genre: Option<String>
}
