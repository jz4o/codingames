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
    let r = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let c = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let t = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let sum_r_index_digits: Vec<i32> = (0..r).map(|index| index.to_string().chars().map(|chr| chr.to_string().parse::<i32>().unwrap()).sum()).collect();
    let sum_c_index_digits: Vec<i32> = (0..c).map(|index| index.to_string().chars().map(|chr| chr.to_string().parse::<i32>().unwrap()).sum()).collect();

    let mut grid: Grid = Grid::new();
    for (row_index, row_sum) in sum_r_index_digits.iter().enumerate() {
        let mut row: Row = Row::new();
        for (column_index, column_sum) in sum_c_index_digits.iter().enumerate() {
            let cell: Cell = Cell::new(row_index, column_index, row_sum + column_sum);
            row.add_cell(cell);
        }

        grid.add_row(row);
    }

    grid.check_reachable_cells(t);

    let result: usize = grid.count_reachable_cell();

    // println!("answer");
    println!("{result}");
}

struct Grid {
    rows: Vec<Row>
}

impl Grid {
    fn new() -> Grid {
        return Grid{rows: Vec::new()};
    }

    fn add_row(&mut self, row: Row) {
        self.rows.push(row);
    }

    fn check_reachable_cells(&mut self, threshold: i32) {
        let bottom_right_cell_y = self.rows.last().unwrap().cells.last().unwrap().y;
        let bottom_right_cell_x = self.rows.last().unwrap().cells.last().unwrap().x;

        self.check_reachable_cell(bottom_right_cell_y, bottom_right_cell_x, threshold);
    }

    fn check_reachable_cell(&mut self, target_y: usize, target_x: usize, threshold: i32) -> bool {
        let target_cell_is_reachable: Option<bool> = self.rows[target_y].cells[target_x].is_reachable;
        if target_cell_is_reachable.is_some() {
            return target_cell_is_reachable.unwrap();
        }

        let target_cell_y: usize = self.rows[target_y].cells[target_x].y;
        let target_cell_x: usize = self.rows[target_y].cells[target_x].x;
        let target_cell_value: i32 = self.rows[target_y].cells[target_x].value;

        let accessible_value: bool = target_cell_value <= threshold;
        let is_upper_left_cell: bool = target_cell_y == 0 && target_cell_x == 0;
        let top_cell_is_reachable: bool = if target_cell_y != 0 {
            self.check_reachable_cell(target_cell_y - 1, target_cell_x, threshold)
        } else {
            false
        };
        let left_cell_is_reachable: bool = if target_cell_x != 0 {
            self.check_reachable_cell(target_cell_y, target_cell_x - 1, threshold)
        } else {
            false
        };

        let is_reachable_cell: bool = is_upper_left_cell || top_cell_is_reachable || left_cell_is_reachable;
        self.rows[target_y].cells[target_x].is_reachable = Some(accessible_value && is_reachable_cell);

        return self.rows[target_y].cells[target_x].is_reachable.unwrap();
    }

    fn count_reachable_cell(&mut self) -> usize {
        return self.rows.iter().flat_map(|row| &row.cells).filter(|cell| cell.is_reachable.unwrap_or(false)).count();
    }
}

struct Row {
    cells: Vec<Cell>
}

impl Row {
    fn new() -> Row {
        return Row{cells: Vec::new()};
    }

    fn add_cell(&mut self, cell: Cell) {
        self.cells.push(cell);
    }
}

struct Cell {
    y: usize,
    x: usize,
    value: i32,
    is_reachable: Option<bool>
}

impl Cell {
    fn new(y: usize, x: usize, value: i32) -> Cell {
        return Cell {
            y: y,
            x: x,
            value: value,
            is_reachable: None
        };
    }
}
