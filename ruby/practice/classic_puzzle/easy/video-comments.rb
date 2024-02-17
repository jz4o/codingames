# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
comments = []
n.times do
  comment = gets.chomp
  comments << comment
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Comment
  attr_reader :origin, :user_name, :date, :likes, :priority, :index
  attr_accessor :parent_index

  def initialize(comment_str, index)
    @origin = comment_str
    @user_name, date, likes, priority = comment_str.split '|'
    @date = date.delete(':').to_i
    @likes = likes.to_i
    @priority = %w[Pinned Followed none].index(priority)
    @index = index
  end

  def self.sort(comments)
    comments.sort_by { |comment| [comment.priority, -comment.likes, -comment.date, comment.index] }
  end
end

all_comments = comments.map.with_index { |comment, index| Comment.new comment, index }

parent_index = nil
all_comments.each do |comment|
  if comment.user_name.start_with? ' ' * 4
    comment.parent_index = parent_index
  else
    parent_index = comment.index
  end
end

origin_comments = all_comments.filter { |comment| comment.parent_index.nil? }
reply_comments = all_comments - origin_comments

sorted_comments = []
sorted_comments += Comment.sort origin_comments
reply_comments.sort_by(&:parent_index).chunk(&:parent_index).each do |index, chunk_reply_comments|
  parent_comment_index = sorted_comments.index { |comment| comment.index == index }

  sorted_comments.insert parent_comment_index + 1, *Comment.sort(chunk_reply_comments)
end

results = sorted_comments.map(&:origin)

# puts "answer"
results.each do |result|
  puts result
end
