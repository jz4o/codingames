# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

word = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

PERIODICS = %w[
  H He Li Be B C N O F Ne
  Na Mg Al Si P S Cl Ar K Ca
  Sc Ti V Cr Mn Fe Co Ni Cu Zn
  Ga Ge As Se Br Kr Rb Sr Y Zr
  Nb Mo Tc Ru Rh Pd Ag Cd In Sn
  Sb Te I Xe Cs Ba La Ce Pr Nd
  Pm Sm Eu Gd Tb Dy Ho Er Tm Yb
  Lu Hf Ta W Re Os Ir Pt Au Hg
  Tl Pb Bi Po At Rn Fr Ra Ac Th
  Pa U Np Pu Am Cm Bk Cf Es Fm
  Md No Lr Rf Db Sg Bh Hs Mt Ds
  Rg Cn Nh Fl Mc Lv Ts Og
].freeze
DOWNCASE_PERIODICS = PERIODICS.map(&:downcase)

downcase_word = word.downcase

periodics_array = [[]]
temp_results = []
while periodics = periodics_array.pop
  joined_periodics = periodics.join
  temp_results << periodics and next if joined_periodics == downcase_word

  remaining_word = downcase_word.delete_prefix joined_periodics
  periodics_array += DOWNCASE_PERIODICS.filter { |periodic| remaining_word.start_with? periodic }
                                       .map { |periodic| periodics + [periodic] }
end

results =
  if temp_results.any?
    temp_results.map do |result_periodics|
      result_periodics.map { |periodic| PERIODICS[DOWNCASE_PERIODICS.index periodic] }.join
    end
  else
    ['none']
  end
results.sort!

# puts "spellings"
results.each do |result|
  puts result
end
