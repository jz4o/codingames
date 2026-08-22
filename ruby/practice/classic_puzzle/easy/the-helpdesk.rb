# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

worktime = gets.to_i
nc = gets.to_i
inputs = gets.split
efficiencies = []
nc.times do |i|
  efficiency = inputs[i].to_f
  efficiencies << efficiency
end
nv = gets.to_i
inputs = gets.split
helptimes = []
nv.times do |i|
  helptime = inputs[i].to_i
  helptimes << helptime
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Counter
  attr_reader :remaining_time, :helped_count, :break_count

  def initialize(worktime, efficiency)
    @worktime = worktime
    @efficiency = efficiency

    @elapsed_worktime = 0
    @remaining_time = 0
    @break_count = 0
    @helped_count = 0
  end

  def visit(helptime)
    @remaining_time = Rational(helptime, @efficiency)

    @helped_count += 1
  end

  def elapse(time)
    @elapsed_worktime += time
    @remaining_time -= time
  end

  def in_progress?
    @remaining_time.positive?
  end

  def done?
    @remaining_time.zero?
  end

  def can_help?
    @elapsed_worktime < @worktime
  end

  def can_break?
    @worktime <= @elapsed_worktime
  end

  def break
    break_time = 10
    @elapsed_worktime = -break_time
    @remaining_time = break_time
    @break_count += 1
  end
end

counters = efficiencies.map do |efficiency|
  Counter.new worktime, efficiency
end

waiting_visitor_helptimes = helptimes.dup

counters.each do |counter|
  helptime = waiting_visitor_helptimes.shift
  break unless helptime

  counter.visit helptime
end
active_counters = counters.filter(&:in_progress?)

while active_counters.any?
  elapse_time = active_counters.map(&:remaining_time).min
  active_counters.each { |counter| counter.elapse elapse_time }

  done_counters = active_counters.filter(&:done?)
  can_next_help_counters = done_counters.filter(&:can_help?)
  can_break_counters = done_counters.filter(&:can_break?)

  can_next_help_counters.each do |counter|
    helptime = waiting_visitor_helptimes.shift
    unless helptime
      active_counters.delete counter
      next
    end

    counter.visit helptime
  end

  can_break_counters.each do |counter|
    if waiting_visitor_helptimes.any?
      counter.break
    else
      active_counters.delete counter
    end
  end
end

results = [
  counters.map(&:helped_count).join(' '),
  counters.map(&:break_count).join(' ')
]

# puts "answer"
results.each do |result|
  puts result
end
