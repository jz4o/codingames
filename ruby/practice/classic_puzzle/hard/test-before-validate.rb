# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
actions = []
n.times do
  action = gets.chomp

  actions << action
end
nb_orders = gets.to_i
orders = []
nb_orders.times do
  order = gets.chomp

  orders << order
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require_actions = {}
orders.each do |order|
  first, second, third = order.split
  before, after = second == 'before' ? [first, third] : [third, first]

  require_actions[after] = [] unless require_actions[after]
  require_actions[after] << before
end

available_actions = actions - require_actions.keys

temp_actions = actions

results = []
while temp_actions.any?
  action = (temp_actions & available_actions).first

  available_actions.delete action
  temp_actions.delete action

  require_actions.each_value { |v| v.delete action }
  available_actions += require_actions.filter { |_, v| v.empty? }.keys
  require_actions.delete_if { |_, v| v.empty? }

  results << action
end

# puts "answer"
results.each do |result|
  puts result
end
