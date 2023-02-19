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
    let mut spread_sheet: SpreadSheet = SpreadSheet::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let operation = inputs[0].trim().to_string();
        let arg_1 = inputs[1].trim().to_string();
        let arg_2 = inputs[2].trim().to_string();

        let mut cell: Cell = Cell::new(operation, arg_1, arg_2);
        spread_sheet.add_cell(cell);
    }
    for i in 0..n as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let result: String = spread_sheet.get_cell_value(i);

        // println!("1");
        println!("{result}");
    }
}

struct SpreadSheet {
    cells: Vec<Cell>
}

impl SpreadSheet {
    fn new() -> SpreadSheet {
        return SpreadSheet{cells: vec![]};
    }

    fn add_cell(&mut self, cell: Cell) {
        self.cells.push(cell);
    }

    fn get_cell_value(&mut self, cell_index: usize) -> String {
        if self.cells[cell_index].value.is_some() {
            return self.cells[cell_index].value.as_ref().unwrap().to_string();
        }

        let arg1_value: i32 = self.get_arg_value(self.cells[cell_index].arg1.to_string()).parse::<i32>().unwrap();
        let arg2_value: i32 = self.get_arg_value(self.cells[cell_index].arg2.to_string()).parse::<i32>().unwrap();

        let result: String = match self.cells[cell_index].operation.as_str() {
            "VALUE" => arg1_value.to_string(),
            "ADD" => (arg1_value + arg2_value).to_string(),
            "SUB" => (arg1_value - arg2_value).to_string(),
            "MULT" => (arg1_value * arg2_value).to_string(),
            _ => "".to_string() // Not Arrive
        };

        self.cells.get_mut(cell_index).unwrap().value = Some(result.to_string());

        return self.cells[cell_index].value.as_ref().unwrap().to_string();
    }

    fn get_arg_value(&mut self, arg: String) -> String {
        return if arg.starts_with(&"$") {
            self.get_cell_value(arg[1..].parse::<usize>().unwrap())
        } else if arg == "_" {
            "0".to_string()
        } else {
            arg
        };
    }
}

struct Cell {
    operation: String,
    arg1: String,
    arg2: String,
    value: Option<String>
}

impl Cell {
    fn new(operation: String, arg1: String, arg2: String) -> Cell {
        return Cell{
            operation: operation,
            arg1: arg1,
            arg2: arg2,
            value: None
        };
    }
}
