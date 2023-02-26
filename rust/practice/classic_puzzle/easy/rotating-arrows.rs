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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let x = parse_input!(inputs[0], i32);
    let y = parse_input!(inputs[1], i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim().to_string(); // The line of w arrows represented by ascii char ^v<>
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    lines = lines.iter().map(|line| format!("X{line}X")).collect();
    lines.insert(0, "X".repeat(w as usize + 2));
    lines.push("X".repeat(w as usize + 2));

    let mut grid: Vec<Vec<Position>> = Vec::new();
    for (line_index, line) in lines.iter().enumerate() {
        let row: Vec<Position> = line
            .chars()
            .enumerate()
            .map(|(char_index, c)| Position{y: line_index, x: char_index, value: c.to_string()})
            .collect();

        grid.push(row);
    }

    let mut result: usize = 0;

    let mut current_position: &mut Position = grid.get_mut(y as usize + 1).unwrap().get_mut(x as usize + 1).unwrap();
    loop {
        result += 1;

        current_position.rotate_arrow();
        let (arrow_y, arrow_x): (usize, usize) = current_position.arrow_position();

        current_position = grid.get_mut(arrow_y).unwrap().get_mut(arrow_x).unwrap();

        if current_position.is_equal_position(y as usize + 1, x as usize + 1) || current_position.is_overflow() {
            break;
        }
    }

    // println!("0");
    println!("{result}");
}

struct Position {
    y: usize,
    x: usize,
    value: String
}

impl Position {
    fn arrow_position(&mut self) -> (usize, usize) {
        return match self.value.as_str() {
            "^" => (self.y - 1, self.x),
            ">" => (self.y, self.x + 1),
            "v" => (self.y + 1, self.x),
            "<" => (self.y, self.x - 1),
            _ => (0, 0)
        };
    }

    fn rotate_arrow(&mut self) {
        let arrows : [&str;4] = ["^", ">", "v", "<"];
        let arrow_index: usize = arrows.iter().position(|arrow| arrow.to_string() == self.value).unwrap();
        let next_arrow: String = arrows[(arrow_index + 1) % arrows.len()].to_string();

        self.value = next_arrow;
    }

    fn is_equal_position(&mut self, y: usize, x: usize) -> bool {
        return self.y == y && self.x == x;
    }

    fn is_overflow(&mut self) -> bool {
        return self.value == "X";
    }
}
