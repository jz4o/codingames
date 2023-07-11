# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = gets.chomp
n = gets.to_i
ms = []
n.times do
  m = gets.chomp
  ms << m
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Warrior = Struct.new :y, :x, :money
Enemy = Struct.new :y, :x, :name
Money = Struct.new :y, :x, :value

warrior = Warrior.new 0, 0, 50

units = ms.map do |m|
  y, x, type, value = m.split
  y = y.to_i
  x = x.to_i

  case type
  when 'enemy'
    Enemy.new y, x, value
  when 'money'
    Money.new y, x, value.delete_suffix('G').to_i
  end
end

result = nil
s.chars.each do |direction|
  case direction
  when 'R'
    warrior.x += 1
  when 'L'
    warrior.x -= 1
  when 'U'
    warrior.y -= 1
  when 'D'
    warrior.y += 1
  end

  unit = units.find { |u| u.y == warrior.y && u.x == warrior.x }
  next unless unit

  if unit.instance_of? Enemy
    # avoid a fight
    warrior.money -= 50 and next if unit.name == 'goblin' && warrior.money >= 50

    result = "#{warrior.y} #{warrior.x} #{warrior.money}G #{unit.name}"
    break
  elsif unit.instance_of? Money
    warrior.money += unit.value
    units.delete unit
  end
end

result ||= "GameClear #{warrior.y} #{warrior.x} #{warrior.money}G"

# puts "result"
puts result
