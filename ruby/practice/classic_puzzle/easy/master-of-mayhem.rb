# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

cyborg_count = gets.to_i
cyborg_names = []
cyborg_count.times do
  cyborg_name = gets.chomp
  cyborg_names << cyborg_name
end
mayhem_report_count = gets.to_i
mayhem_reports = []
mayhem_report_count.times do
  mayhem_report = gets.chomp
  mayhem_reports << mayhem_report
end
cyborg_report_count = gets.to_i
cyborg_reports = []
cyborg_report_count.times do
  cyborg_report = gets.chomp
  cyborg_reports << cyborg_report
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

mayhem_attributes = {}
mayhem_reports.each do |mayhem_report|
  attribute, *, value = mayhem_report.scan(/^Mayhem's (.*?) (is)?( an?)? "?(.*?)"?$/).flatten

  mayhem_attributes[attribute] = value
end

cyborgs_attributes = cyborg_names.to_h { |name| [name, {}] }
cyborg_reports.each do |cyborg_report|
  name, attribute, *, value = cyborg_report.scan(/^(.*)'s (.*?) (is)?( an?)? "?(.*?)"?$/).flatten

  cyborgs_attributes[name][attribute] = value
end

mayhem_attributes.each do |mayhem_attribute, mayhem_value|
  cyborgs_attributes.each do |cyborg_name, cyborg_attributes|
    if mayhem_attribute == 'word'
      next unless cyborg_attributes.key? 'catchphrase'

      cyborgs_attributes.delete cyborg_name unless cyborg_attributes['catchphrase'].include? mayhem_value
    else
      next unless cyborg_attributes.key? mayhem_attribute

      cyborgs_attributes.delete cyborg_name if mayhem_value != cyborg_attributes[mayhem_attribute]
    end
  end
end

candidate_cyborg_names = cyborgs_attributes.keys

result =
  case candidate_cyborg_names.size
  when 0
    'MISSING'
  when 1
    candidate_cyborg_names.first
  when 2..Float::INFINITY
    'INDETERMINATE'
  end

# puts "CYBORG"
puts result
