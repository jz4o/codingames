# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

stack_1data = gets.chomp
stack_2data = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Stack = Struct.new :name, :amount, :health, :damage, :surplus_damage

def combat(attack, defense)
  damage = attack.damage * attack.amount
  perish, surplus_damage = (damage + defense.surplus_damage).divmod defense.health
  perish = [perish, defense.amount].min

  log = [
    "#{attack.amount} #{attack.name}(s) attack(s) #{defense.amount} #{defense.name}(s) dealing #{damage} damage",
    "#{perish} unit(s) perish"
  ]
  defense.amount -= perish
  defense.surplus_damage = surplus_damage

  log
end

stack1_name, stack1_amount, stack1_health, stack1_damage = stack_1data.split ';'
stack1_amount = stack1_amount.to_i
stack1_health = stack1_health.to_i
stack1_damage = stack1_damage.to_i
stack1 = Stack.new stack1_name, stack1_amount, stack1_health, stack1_damage, 0

stack2_name, stack2_amount, stack2_health, stack2_damage = stack_2data.split ';'
stack2_amount = stack2_amount.to_i
stack2_health = stack2_health.to_i
stack2_damage = stack2_damage.to_i
stack2 = Stack.new stack2_name, stack2_amount, stack2_health, stack2_damage, 0

round = 0
results = []
loop do
  round += 1
  results << "Round #{round}"

  results.concat combat(stack1, stack2)
  results << '----------'
  break if stack2.amount.zero?

  results.concat combat(stack2, stack1)
  results << '##########'
  break if stack1.amount.zero?
end

winner = stack1.amount.zero? ? stack2 : stack1
results << "#{winner.name} won! #{winner.amount} unit(s) left"

# puts "Victory!"
results.each do |result|
  puts result
end
