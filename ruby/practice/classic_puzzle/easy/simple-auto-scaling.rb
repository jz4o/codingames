# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s, m = gets.split.collect(&:to_i)
inputs = gets.split
service_maxclients = []
(0...s).each do |i|
  maxclients = inputs[i].to_i
  service_maxclients << maxclients
end
service_clients = []
m.times do
  service_clients_row = []
  inputs = gets.split
  (0...s).each do |j|
    clients = inputs[j].to_i
    service_clients_row << clients
  end
  service_clients << service_clients_row
end
temp_instances = [0] * s
m.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  service_clients_row = service_clients.shift

  instances = service_clients_row.zip(service_maxclients).map { |client, maxclient| (client / maxclient.to_f).ceil }

  scalings = instances.zip(temp_instances).map { |instance, temp_instance| instance - temp_instance }
  temp_instances = instances

  result = scalings.join(' ')

  # puts "Number of services to start / stop"
  puts result
end
