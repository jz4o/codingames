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
    let level = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let xp = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const EXP_OF_PUZZLE: i32 = 300;

    let blitz_prog: BlitzProg = reflect_exp(level, EXP_OF_PUZZLE * n, xp);

    // println!("answer");
    println!("{}", blitz_prog.level);
    println!("{}", blitz_prog.exp_to_level_up);
}

struct BlitzProg {
    level: i32,
    exp_to_level_up: i32
}

fn reflect_exp(current_level: i32, exp: i32, level_up_exp: i32) -> BlitzProg {
    let temp_exp: i32 = exp - if level_up_exp >= 0 {
        level_up_exp
    } else {
        get_exp_for_level_up(current_level)
    };

    return if temp_exp < 0 {
        BlitzProg{level: current_level, exp_to_level_up: temp_exp * -1}
    } else {
        reflect_exp(current_level + 1, temp_exp, -1)
    };
}

fn get_exp_for_level_up(current_level: i32) -> i32 {
    return (current_level as f32 * (current_level as f32).sqrt() * 10f32) as i32;
}
