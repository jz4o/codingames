# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
companies = []
n.times do
  company = gets.chomp
  companies << company
end
a = gets.to_i
attacks = []
a.times do
  attack = gets.chomp
  attacks << attack
end
# n.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "company:status"
# end

PROTECTION_LEVEL = {
  0 => {
    ps: 0,
    bf: 500,
    mi: 1000
  },
  5 => {
    ps: 0,
    bf: 5000,
    mi: 3000
  },
  7 => {
    ps: 10_000,
    bf: Float::INFINITY,
    mi: Float::INFINITY
  }
}.freeze

attack_summary = {}
attacks.each do |attack|
  company_name, stage, strength = attack.split ':'

  attack_summary[company_name] = { ps: 0, bf: 0, mi: 0 } unless attack_summary.key? company_name
  attack_summary[company_name][stage.to_sym] += strength.to_i
end

results = companies.map do |company|
  name, pl = company.split ':'
  pl = pl.to_i

  protection_level_key = PROTECTION_LEVEL.keys.filter { |key| key <= pl }.max
  protection_level = PROTECTION_LEVEL[protection_level_key]

  attack_result = attack_summary[name].all? { |key, value| protection_level[key] <= value } ? 'Hacked' : 'Blocked'
  [name, attack_result].join ':'
end

results.each do |result|
  puts result
end
