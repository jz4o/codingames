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
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let v = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let m = parse_input!(input_line, i32);
    let mut input_rows: Vec<(i32, i32, i32)> = Vec::new();
    for i in 0..m as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let inputs = input_line.split(" ").collect::<Vec<_>>();
        let p = parse_input!(inputs[0], i32);
        let l = parse_input!(inputs[1], i32);
        let r = parse_input!(inputs[2], i32);
        input_rows.push((p, l, r));
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let nodes: Vec<Node> = input_rows.iter().map(|(p, l, r)| Node{node_index: *p, child_index_l: *l, child_index_r: *r}).collect();

    let mut tree_path: Vec<String> = Vec::new();

    let mut target_node_index: i32 = v;
    loop {
        let parent_node_candidates: Vec<&Node> = nodes.iter().filter(|node| node.has_child(target_node_index)).collect();
        if parent_node_candidates.is_empty() {
            break;
        }

        let parent_node: &Node = parent_node_candidates.first().unwrap();

        tree_path.insert(0, parent_node.direction(target_node_index));
        target_node_index = parent_node.node_index;
    }

    let result: String = if tree_path.is_empty() { "Root".to_string() } else { tree_path.join(" ") };

    // println!("tree_path");
    println!("{result}");
}

struct Node {
    node_index: i32,
    child_index_l: i32,
    child_index_r: i32
}

impl Node {
    fn has_child(&self, node_index: i32) -> bool {
        return vec![self.child_index_l, self.child_index_r].contains(&node_index);
    }

    fn direction(&self, child_node_index: i32) -> String {
        return if self.child_index_l == child_node_index { "Left".to_string() } else { "Right".to_string() };
    }
}
