# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@h = gets.to_i
map = []
@h.times do
  map << gets.chomp
end

LEFT_PART  = '/'.freeze
RIGHT_PART = '\\'.freeze
PART_EMPTY = '.'.freeze

is_stable =true
catch :check do
  @h.times do |height|
    is_bottom_row = height.eql?(@h-1)
    (@h*2).times do |width|
      card = map[height][width]

      next if card.eql? PART_EMPTY

      side_card, partner_part = card.eql?(RIGHT_PART) ?
        [ map[height][width-1], LEFT_PART ] :
        [ map[height][width+1], RIGHT_PART]

      check_side_card  = side_card.eql? partner_part
      check_under_card = is_bottom_row || map[height+1][width].eql?(partner_part)

      unless check_side_card && check_under_card
        is_stable = false
        throw :check
      end
    end
  end
end

puts is_stable ? 'STABLE' : 'UNSTABLE'

