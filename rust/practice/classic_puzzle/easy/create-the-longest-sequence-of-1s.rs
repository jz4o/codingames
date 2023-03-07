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
    let b = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut chunked_bits: Vec<ChunkedBit> = Vec::new();
    for c in b.chars() {
        if chunked_bits.is_empty() || chunked_bits.last().unwrap().bit != c {
            chunked_bits.push(ChunkedBit{bit: c, size: 1});
        } else {
            chunked_bits.last_mut().unwrap().size += 1;
        }
    }

    let mut sequences: Vec<i32> = Vec::new();
    if chunked_bits.len() == 1 {
        // all bits is equal

        let chunked_bit: &ChunkedBit = chunked_bits.first().unwrap();
        sequences.push(if chunked_bit.bit == '1' { chunked_bit.size - 1 } else { 1 });
    } else {
        // extend a positive
        sequences.extend(chunked_bits.iter().filter(|chunk| chunk.bit == '1').map(|chunk| chunk.size + 1));

        // connect two positive
        for i in 0..chunked_bits.len() - 2 {
            let previous_chunk: &ChunkedBit = &chunked_bits[i];
            let current_chunk: &ChunkedBit = &chunked_bits[i + 1];
            let next_chunk: &ChunkedBit = &chunked_bits[i + 2];

            if current_chunk.bit != '0' {
                continue;
            }

            if current_chunk.size != 1 {
                continue;
            }

            sequences.push(previous_chunk.size + current_chunk.size + next_chunk.size);
        }
    }

    let result: String = sequences.iter().max().unwrap().to_string();

    // println!("answer");
    println!("{result}");
}

struct ChunkedBit {
    bit: char,
    size: i32
}
