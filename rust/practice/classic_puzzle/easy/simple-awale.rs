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
    let op_bowls = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let my_bowls = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let num = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");


    const BOWLS_SIZE: usize = 7;
    const PLAYER_SIZE: usize = 2;

    const MY_BOWLS_INDEX: usize = 1;

    let mut bowls: Vec<Vec<i32>> = vec![
        op_bowls.split_whitespace().map(|s| s.to_string().parse::<i32>().unwrap()).collect(),
        my_bowls.split_whitespace().map(|s| s.to_string().parse::<i32>().unwrap()).collect()
    ];
    let mut seeds: i32 = *bowls.last().unwrap().get(num as usize).unwrap();
    bowls.get_mut(MY_BOWLS_INDEX).unwrap()[num as usize] = 0;

    let mut index: usize = num as usize + 1;

    while seeds > 0 {
        let row_index: i32 = (((index / BOWLS_SIZE) % PLAYER_SIZE) - 1) as i32 * -1;
        let column_index: usize = index % BOWLS_SIZE;

        let enemy_store: bool = row_index == 0 && column_index == BOWLS_SIZE - 1;
        if enemy_store {
            index += 1;
            continue;
        }

        bowls.get_mut(row_index as usize).unwrap()[column_index] += 1;
        index += 1;
        seeds -= 1;
    }

    let mut my_bowls_vec: Vec<i32> = bowls.pop().unwrap();
    let my_bowls_last: i32 = my_bowls_vec.pop().unwrap();
    let mut op_bowls_vec: Vec<i32> = bowls.pop().unwrap();
    let op_bowls_last: i32 = op_bowls_vec.pop().unwrap();

    let mut results: Vec<String> = Vec::new();
    results.push(format!("{} [{}]", op_bowls_vec.iter().map(|b| b.to_string()).collect::<Vec<String>>().join(" "), op_bowls_last));
    results.push(format!("{} [{}]", my_bowls_vec.iter().map(|b| b.to_string()).collect::<Vec<String>>().join(" "), my_bowls_last));
    if index % BOWLS_SIZE == 0 {
        results.push("REPLAY".to_string());
    }

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
