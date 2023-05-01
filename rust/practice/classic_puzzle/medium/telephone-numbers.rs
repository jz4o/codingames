use std::io;

use regex::Regex;
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
    let mut telephones: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let telephone = input_line.trim().to_string();
        telephones.push(telephone);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let root_node: NumberNode = NumberNode::new();
    let mut number_tree: NumberNode = root_node;
    for telephone in telephones.iter() {
        let mut target_node: &mut NumberNode = &mut number_tree;
        for num in telephone.chars() {
            if !target_node.has_child(&num) {
                target_node.add_child(&num);
            }

            target_node = target_node.get_mut_children(&num);
        }
    }

    let result: usize = number_tree.get_node_count();

    // The number of elements (referencing a number) stored in the structure.
    // println!("number");
    println!("{result}");
}

#[derive(Debug)]
struct NumberNode {
    children: HashMap<char, NumberNode>
}

impl NumberNode {
    fn new() -> NumberNode {
        return NumberNode { children: HashMap::new() };
    }

    fn has_child(&mut self, num: &char) -> bool {
        return self.children.contains_key(num);
    }

    fn add_child(&mut self, num: &char) {
        self.children.insert(*num, NumberNode::new());
    }

    fn get_mut_children(&mut self, num: &char) -> &mut NumberNode {
        return self.children.get_mut(num).unwrap();
    }

    fn get_node_count(self) -> usize {
        return Regex::new(r"\d").unwrap().find_iter(&format!("{:?}", self)).count();
    }
}
