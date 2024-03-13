# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rotations = gets.chomp
face1 = gets.chomp
face2 = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

rotation_hash = {
  'x' => {
    'U' => 'B',
    'F' => 'U',
    'D' => 'F',
    'B' => 'D'
  },
  "x'" => {
    'U' => 'F',
    'F' => 'D',
    'D' => 'B',
    'B' => 'U'
  },
  'y' => {
    'L' => 'B',
    'F' => 'L',
    'R' => 'F',
    'B' => 'R'
  },
  "y'" => {
    'L' => 'F',
    'F' => 'R',
    'R' => 'B',
    'B' => 'L'
  },
  'z' => {
    'U' => 'R',
    'L' => 'U',
    'D' => 'L',
    'R' => 'D'
  },
  "z'" => {
    'U' => 'L',
    'L' => 'D',
    'D' => 'R',
    'R' => 'U'
  }
}

after_face1 = face1
after_face2 = face2

rotations.split.each do |rotation|
  after_face1 = rotation_hash[rotation][after_face1] || after_face1
  after_face2 = rotation_hash[rotation][after_face2] || after_face2
end

results = [after_face1, after_face2]

# puts "face1"
# puts "face2"
results.each do |result|
  puts result
end
