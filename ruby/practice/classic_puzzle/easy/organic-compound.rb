# PREFIX IN ASCENDING ORDER:
# 'meth', 'eth', 'prop', 'but', 'pent', 'hex', 'hept', 'oct', 'non', 'dec'

formula = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Daterminor
  def initialize(formula)
    @formula = formula

    @c_count = count_atom 'C'
    @h_count = count_atom 'H'
    @o_count = count_atom 'O'
  end

  def chemical_name
    prefix = prefix_name
    suffix = suffix_name

    prefix && suffix && c_count_is_valid? ? "#{prefix}#{suffix}" : 'OTHERS'
  end

  private

  def prefix_name
    prefix_names = [nil, 'meth', 'eth', 'prop', 'but', 'pent', 'hex', 'hept', 'oct', 'non', 'dec']

    prefix_names[@c_count]
  end

  def suffix_name
    check_method_and_name = {
      alkane?: 'ane',
      alkene?: 'ene',
      alcohol?: 'anol',
      carboxylic?: 'anoic acid',
      aldehide?: 'anal',
      ketone?: 'anone'
    }

    check_method_and_name.each do |method_name, suffix|
      return suffix if method(method_name).call
    end

    nil
  end

  def alkane?
    @h_count == @c_count * 2 + 2 && @o_count.zero?
  end

  def alkene?
    @h_count == @c_count * 2 && @o_count.zero?
  end

  def alcohol?
    @formula.end_with?('OH') && @h_count == @c_count * 2 + 2
  end

  def carboxylic?
    @formula.end_with?('COOH') && @h_count == @c_count * 2
  end

  def aldehide?
    @formula.end_with?('CHO') && @h_count == @c_count * 2
  end

  def ketone?
    @formula.scan('CO').one? && !@formula.match?(/^CO|CO$/) && @h_count == @c_count * 2
  end

  def c_count_is_valid?
    @o_count <= @formula.match(/COOH|OH|CHO|CO/).to_s.count('O')
  end

  def count_atom(atom)
    @formula.scan(Regexp.new("#{atom}\\d*")).sum do |atom_match|
      [atom_match.delete_prefix(atom).to_i, 1].max
    end
  end
end

daterminor = Daterminor.new formula
result = daterminor.chemical_name

# puts "organic compound name"
puts result
