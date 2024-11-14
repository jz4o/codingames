# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
fnames = []
n.times do
  fname = gets.chomp
  fnames << fname
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Keyword = Struct.new :row_index, :column_index
Function = Struct.new :begin_row_index, :end_row_index

temp_fname = fnames.dup

inserts = []
semicolons = []
begin_row_indexes = []
end_row_indexes = []
temp_fname.each_with_index do |fname, index|
  downcase_fname = fname.downcase

  comment_index = downcase_fname.index('--') || downcase_fname.length

  insert_search_pos = 0
  while insert_match = downcase_fname.match(/(^|;|\s)(insert)\s/, insert_search_pos)
    match_index, insert_search_pos = insert_match.offset(2)
    break if comment_index <= match_index

    inserts << Keyword.new(index, match_index)
  end

  semicolon_search_pos = 0
  while semicolon_match = fname.match(';', semicolon_search_pos)
    match_index, semicolon_search_pos = semicolon_match.offset(0)
    break if comment_index <= match_index

    semicolons << Keyword.new(index, match_index)
  end

  begin_row_indexes << index if downcase_fname.start_with? 'begin'
  end_row_indexes << index if downcase_fname.start_with? 'end'
end
functions = begin_row_indexes.zip(end_row_indexes).map do |begin_row_index, end_row_index|
  Function.new begin_row_index, end_row_index
end

inserts.reverse_each do |insert|
  next if functions.any? { |function| (function.begin_row_index..function.end_row_index).cover? insert.row_index }

  semicolon = semicolons.find do |semi|
    (insert.row_index == semi.row_index && insert.column_index < semi.column_index) ||
      insert.row_index < semi.row_index
  end

  if insert.row_index == semicolon.row_index
    temp_fname[insert.row_index][insert.column_index..semicolon.column_index] = ''
  else
    temp_fname[semicolon.row_index][..semicolon.column_index] = ''
    temp_fname.delete_at semicolon.row_index if temp_fname[semicolon.row_index].empty?

    comments = temp_fname[(insert.row_index + 1)..(semicolon.row_index - 1)].filter_map do |fname|
      fname.scan(/--.*$/)
    end
    temp_fname[(insert.row_index + 1)..(semicolon.row_index - 1)] = comments

    insert_row_comment = temp_fname[insert.row_index][insert.column_index..].match(/--.*$/).to_s
    temp_fname[insert.row_index][insert.column_index..] = insert_row_comment
  end
  temp_fname.delete_at insert.row_index if temp_fname[insert.row_index].empty?
end

results = temp_fname

# puts "answer"
results.each do |result|
  puts result
end
