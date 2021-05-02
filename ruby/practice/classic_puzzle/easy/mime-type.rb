# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i # Number of elements which make up the association table.
@q = gets.to_i # Number Q of file names to be analyzed.
exts = []
mts  = []
@n.times do
  # ext: file extension
  # mt: MIME type.
  v = gets.split
  exts << v[0].downcase
  mts  << v[1]
end

fnames = []
@q.times do
  fnames << gets.chomp # One file name per line.
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# For each of the Q filenames, display on a line the corresponding MIME type.
# If there is no corresponding type, then display UNKNOWN.
fnames.each do |fn|
  ext = File.extname("a#{fn}").delete('.').downcase
  index = exts.index(ext)
  puts index ? mts[index] : 'UNKNOWN'
end
