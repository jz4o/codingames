# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

champion1, champion2 = gets.split
n = gets.to_i
input_rows = []
n.times do
  d, attack = gets.split
  input_rows << [d, attack]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Champion
  attr_accessor :life, :rage
  attr_reader :name, :punch, :kick, :hit

  def initialize(name, life, punch, kick)
    @name = name
    @initial_life = life
    @life = life
    @punch = punch
    @kick = kick

    @hit = 0
    @rage = 0
  end

  def special(_opp)
    puts 'not implement'
    0
  end

  def attack(attack_type, opp)
    attack_method = method(attack_type.downcase.to_sym)
    damage = attack_method.parameters.empty? ? attack_method.call : attack_method.call(opp)

    opp.life -= damage
    opp.rage += 1

    @hit += 1
  end
end

class Ken < Champion
  def initialize
    super('KEN', 25, 6, 5)
  end

  def special
    damage = @rage * 3
    @rage = 0

    damage
  end
end

class Ryu < Champion
  def initialize
    super('RYU', 25, 4, 5)
  end

  def special
    damage = @rage * 4
    @rage = 0

    damage
  end
end

class Tank < Champion
  def initialize
    super('TANK', 50, 2, 2)
  end

  def special
    damage = @rage * 2
    @rage = 0

    damage
  end
end

class Vlad < Champion
  def initialize
    super('VLAD', 30, 3, 3)
  end

  def special(opp)
    damage = (@rage + opp.rage) * 2
    opp.rage = 0

    damage
  end
end

class Jade < Champion
  def initialize
    super('JADE', 20, 2, 7)
  end

  def special
    damage = @hit * @rage
    @rage = 0

    damage
  end
end

class Anna < Champion
  def initialize
    super('ANNA', 18, 9, 1)
  end

  def special
    damage = (@initial_life - @life) * @rage
    @rage = 0

    damage
  end
end

class Jun < Champion
  def initialize
    super('JUN', 60, 2, 1)
  end

  def special
    damage = @rage
    @life += @rage
    @rage = 0

    damage
  end
end

champion_classes = [Ken, Ryu, Tank, Vlad, Jade, Anna, Jun]

c1 = champion_classes.find { |champion| champion.to_s.downcase == champion1.downcase }.new
c2 = champion_classes.find { |champion| champion.to_s.downcase == champion2.downcase }.new

input_rows.each do |d, attack|
  if d == '<'
    c2.attack attack, c1
  else
    c1.attack attack, c2
  end

  break if c1.life <= 0 or c2.life <= 0
end

winner, loser = c1.life < c2.life ? [c2, c1] : [c1, c2]

result = "#{winner.name} beats #{loser.name} in #{winner.hit} hits"

# puts "[winner] beats [loser] in [n] hits"
puts result
