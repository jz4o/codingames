# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

teams = gets.chomp
scores1 = gets.chomp
scores2 = gets.chomp
# 2.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "Team name: score minutes_leading"
# end

Point = Struct.new :timestamp, :point, :team
LeadData = Struct.new :team, :point, :advantage_time

TRY = 5
CONVERSION = 2
PENALTY = 3
DROPPED = 3

MATCH_TIME = 80

team1, team2 = teams.split ','
try1, conversion1, penalty1, dropped1 = scores1.split ','
try2, conversion2, penalty2, dropped2 = scores2.split ','

points = []
points.concat(try1.split.map { |t| Point.new t.to_i, TRY, team1 }) unless (try1 || '').empty?
points.concat(conversion1.split.map { |t| Point.new t.to_i, CONVERSION, team1 }) unless (conversion1 || '').empty?
points.concat(penalty1.split.map { |t| Point.new t.to_i, PENALTY, team1 }) unless (penalty1 || '').empty?
points.concat(dropped1.split.map { |t| Point.new t.to_i, DROPPED, team1 }) unless (dropped1 || '').empty?
points.concat(try2.split.map { |t| Point.new t.to_i, TRY, team2 }) unless (try2 || '').empty?
points.concat(conversion2.split.map { |t| Point.new t.to_i, CONVERSION, team2 }) unless (conversion2 || '').empty?
points.concat(penalty2.split.map { |t| Point.new t.to_i, PENALTY, team2 }) unless (penalty2 || '').empty?
points.concat(dropped2.split.map { |t| Point.new t.to_i, DROPPED, team2 }) unless (dropped2 || '').empty?

points.push Point.new 0, 0, ''
points.push Point.new MATCH_TIME + 1, 0, ''

lead_data1 = LeadData.new team1, 0, 0
lead_data2 = LeadData.new team2, 0, 0

points.sort_by(&:timestamp).each_cons(2) do |left, right|
  if lead_data1.point > lead_data2.point
    lead_data1.advantage_time += right.timestamp - left.timestamp
  elsif lead_data1.point < lead_data2.point
    lead_data2.advantage_time += right.timestamp - left.timestamp
  end

  [lead_data1, lead_data2].each do |lead_data|
    next unless lead_data.team == right.team

    lead_data.point += right.point
  end
end

results = [
  "#{lead_data1.team}: #{lead_data1.point} #{lead_data1.advantage_time}",
  "#{lead_data2.team}: #{lead_data2.point} #{lead_data2.advantage_time}"
]

results.each do |result|
  puts result
end
