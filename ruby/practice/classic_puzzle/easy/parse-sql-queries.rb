# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

sql_query = gets.chomp
rows = gets.to_i
table_header = gets.chomp
table_rows = []
rows.times do
  table_row = gets.chomp

  table_rows << table_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

columns = table_header.split
records = table_rows.map { |table_row| columns.zip(table_row.split).to_h }

sql_regexp = '(SELECT)\s(.*)\s(FROM)\s(.*)'
sql_regexp.concat '\s(WHERE)\s(.*)' if sql_query.include? 'WHERE'
sql_regexp.concat '\s(ORDER BY)\s(.*)' if sql_query.include? 'ORDER BY'

query = sql_query.scan(Regexp.new(sql_regexp)).flatten.map(&:strip).each_slice(2).to_h

if query.key? 'WHERE'
  column, value = query['WHERE'].split(' = ')

  records.filter! { |record| record[column] == value }
end

if query.key? 'ORDER BY'
  column, direction = query['ORDER BY'].split

  if records.all? { |record| record[column].match?(/-?\d+\.?\d*/) }
    records.sort_by! { |record| direction == 'ASC' ? record[column].to_f : -record[column].to_f }
  else
    records.sort! { |a, b| direction == 'ASC' ? a[column] <=> b[column] : b[column] <=> a[column] }
  end
end

columns = query['SELECT'].split(', ') if query['SELECT'] != '*'

results = []
results << columns.join(' ')
results.concat(records.map { |record| record.slice(*columns).values.join(' ') })

# puts "outputTableWithColumnTitlesNoRowIndexes"
results.each do |result|
  puts result
end
