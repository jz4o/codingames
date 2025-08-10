# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
k = gets.to_i
strs = []
k.times do
  str = gets.chomp
  strs << str
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

pre_processes_hash = {}
pre_processes_hash.default = []
strs.each do |str|
  pre_process, process = str.split('<').map(&:to_i)
  pre_processes_hash[process] = pre_processes_hash[process] + [pre_process]
end
def pre_processes_hash.circular_references?
  be_check_arrays = keys.zip
  while be_check_array = be_check_arrays.pop
    last_process = be_check_array.last
    pre_processes = self[last_process]
    pre_processes.each do |pre_process|
      return true if be_check_array.include? pre_process

      be_check_arrays << be_check_array + [pre_process]
    end
  end

  false
end

result =
  if pre_processes_hash.circular_references?
    'INVALID'
  else
    processes = (1..n).to_a
    ordered_processes = []
    while processes.any?
      process = processes.find { |process| pre_processes_hash[process].empty? }

      pre_processes_hash.transform_values! do |value|
        value.delete process
        value
      end

      ordered_processes << process
      processes.delete process
    end

    ordered_processes.join ' '
  end

# puts "answer"
puts result
