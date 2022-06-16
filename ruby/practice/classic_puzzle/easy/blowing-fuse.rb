# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, m, c = gets.split.collect(&:to_i)
inputs = gets.split
nxs = []
(0...n).each do |i|
  nx = inputs[i].to_i
  nxs << nx
end
inputs = gets.split
mxs = []
(0...m).each do |i|
  mx = inputs[i].to_i
  mxs << mx
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Device
  def initialize(ampere)
    @ampere = ampere
    @status = :off
  end

  def switch
    if @status == :on
      @status = :off
      -@ampere
    else
      @status = :on
      @ampere
    end
  end
end

devices = nxs.map { |nx| Device.new nx }
devices.unshift Device.new 0

sum_ampere = 0
sum_amperes = mxs.map do |mx|
  device = devices[mx]
  sum_ampere += device.switch
end

results =
  if sum_amperes.max > c
    ['Fuse was blown.']
  else
    [
      'Fuse was not blown.',
      "Maximal consumed current was #{sum_amperes.max} A."
    ]
  end

# puts "Fuse was not blown."
# puts "Maximal consumed current was XX A."
results.each do |result|
  puts result
end
