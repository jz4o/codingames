# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

c = gets.to_i
wirings = []
c.times do
  wiring = gets.chomp
  wirings << wiring
end
a = gets.to_i
switches = []
a.times do
  switch = gets.chomp
  switches << switch
end
switch_status = switches.uniq.to_h { |switch| [switch, switches.count(switch).odd?] }
DESCRIPTION_TYPES = %w[- =].freeze
c.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  wiring = wirings.shift
  wiring_elements = wiring.split

  equipment = wiring_elements.shift
  equipment_description_switches = []
  while wiring_elements.any?
    description_type_index = wiring_elements.rindex { |elm| DESCRIPTION_TYPES.include? elm }

    description_type = wiring_elements[description_type_index]
    description_switches = wiring_elements[description_type_index.next..]
    wiring_elements = wiring_elements[...description_type_index]

    method = description_type == '-' ? :all? : :any?
    equipment_description_switches << description_switches.method(method).call { |switch| switch_status[switch] }
  end

  result = "#{equipment} is #{equipment_description_switches.all? ? 'ON' : 'OFF'}"

  # puts "ANSWER"
  puts result
end
