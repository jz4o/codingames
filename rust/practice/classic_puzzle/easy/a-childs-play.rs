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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let w = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i64);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let grid: Vec<Vec<String>> = lines
        .iter()
        .map(|line| line.chars().map(|c| c.to_string()).collect())
        .collect();

    let mut robot: Robot = grid
        .iter()
        .enumerate()
        .flat_map(|(row_index, row)|
            if row.contains(&"O".to_string()) {
                vec![Robot::new(row_index, row.iter().position(|value| value == "O").unwrap())]
            } else {
                vec![]
            }
        )
        .next()
        .unwrap();

    let mut turn: i64 = 0;
    while turn < n {
        turn += 1;

        robot.log();

        robot.forward();
        loop {
            let (y, x): (usize, usize) = robot.ahead_mass_index();
            if h as usize <= y || w as usize <= x || grid[y][x] != "#" {
                break;
            }

            robot.turn_right();
        }

        // omit to loop turn
        if robot.is_logged_place() {
            turn = robot.skiped_turn(n, turn);
        }
    }

    let result: String = robot.place();

    // println!("answer");
    println!("{result}");
}

struct Robot {
    directions: Vec<String>,
    logs: Vec<String>,
    y: usize,
    x: usize
}

impl Robot {
    fn new(y: usize, x: usize) -> Robot {
        return Robot{
            directions: vec!["N".to_string(), "E".to_string(), "S".to_string(), "W".to_string()],
            logs: vec![],
            y: y,
            x: x
        };
    }

    fn place(&mut self) -> String {
        return format!("{} {}", self.x, self.y);
    }

    fn place_with_direction(&mut self) -> String {
        return format!("{} {}", self.place(), self.direction());
    }

    fn direction(&mut self) -> String {
        return self.directions.first().unwrap().to_string();
    }

    fn forward(&mut self) {
        match self.direction().as_str() {
            "N" => self.y -= 1,
            "E" => self.x += 1,
            "S" => self.y += 1,
            "W" => self.x -= 1,
            _ => () // Not Arrive
        }
    }

    fn ahead_mass_index(&mut self) -> (usize, usize) {
        return match self.direction().as_str() {
            "N" => (self.y - 1, self.x),
            "E" => (self.y, self.x + 1),
            "S" => (self.y + 1, self.x),
            "W" => (self.y, self.x - 1),
            _ => (0, 0) // Not Arrive
        }
    }

    fn turn_right(&mut self) {
        let direction: String = self.directions.remove(0);
        self.directions.push(direction);
    }

    fn log(&mut self) {
        let log: String = self.place_with_direction();
        self.logs.push(log);
    }

    fn is_logged_place(&mut self) -> bool {
        let log: String = self.place_with_direction();

        return self.logs.contains(&log);
    }

    fn skiped_turn(&mut self, n: i64, turn: i64) -> i64 {
        let l: String = self.place_with_direction();
        let loop_begin_turn: i64 = self.logs.iter().position(|log| log == &l).unwrap() as i64;
        let loop_size: i64 = turn - loop_begin_turn;

        return n - ((n - loop_begin_turn) % loop_size);
    }
}
