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

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const TRY_POINT: i32 = 5;
    const TRANSFORM_POINT: i32 = 2;
    const PENA_DROP_POINT: i32 = 3;

    let mut results: Vec<String> = Vec::new();

    let possible_try_times: i32 = n / TRY_POINT;
    for try_times in 0..(possible_try_times + 1) {
        let try_points: i32 = TRY_POINT * try_times;

        let possible_transformation_times: i32 = *[(n - try_points) / TRANSFORM_POINT, try_times].iter().min().unwrap();
        for transformation_times in 0..(possible_transformation_times + 1) {
            let transform_points: i32 = TRANSFORM_POINT * transformation_times;

            let remining_points: i32 = n - try_points - transform_points;
            if remining_points % PENA_DROP_POINT == 0 {
                let penaltie_or_drop_times: i32 = remining_points / PENA_DROP_POINT;

                results.push(format!("{try_times} {transformation_times} {penaltie_or_drop_times}"));
            }
        }
    }

    // println!("tries transformations penalties");
    for result in results {
        println!("{result}")
    }
}
