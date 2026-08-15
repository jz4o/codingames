# UUU F
# CUU L
# AUU I
# GUU V
# UUC F
# CUC L
# AUC I
# GUC V
# UUA L
# CUA L
# AUA I
# GUA V
# UUG L
# CUG L
# AUG M
# GUG V
# UCU S
# CCU P
# ACU T
# GCU A
# UCC S
# CCC P
# ACC T
# GCC A
# UCA S
# CCA P
# ACA T
# GCA A
# UCG S
# CCG P
# ACG T
# GCG A
# UAU Y
# CAU H
# AAU N
# GAU D
# UAC Y
# CAC H
# AAC N
# GAC D
# UAA Stop
# CAA Q
# AAA K
# GAA E
# UAG Stop
# CAG Q
# AAG K
# GAG E
# UGU C
# CGU R
# AGU S
# GGU G
# UGC C
# CGC R
# AGC S
# GGC G
# UGA Stop
# CGA R
# AGA R
# GGA G
# UGG W
# CGG R
# AGG R
# GGG G

n = gets.to_i
rnas = []
n.times do
  rna = gets.chomp
  rnas << rna
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def translate_rna(rna)
  codon_table = {
    UUU: 'F',
    CUU: 'L',
    AUU: 'I',
    GUU: 'V',
    UUC: 'F',
    CUC: 'L',
    AUC: 'I',
    GUC: 'V',
    UUA: 'L',
    CUA: 'L',
    AUA: 'I',
    GUA: 'V',
    UUG: 'L',
    CUG: 'L',
    AUG: 'M',
    GUG: 'V',
    UCU: 'S',
    CCU: 'P',
    ACU: 'T',
    GCU: 'A',
    UCC: 'S',
    CCC: 'P',
    ACC: 'T',
    GCC: 'A',
    UCA: 'S',
    CCA: 'P',
    ACA: 'T',
    GCA: 'A',
    UCG: 'S',
    CCG: 'P',
    ACG: 'T',
    GCG: 'A',
    UAU: 'Y',
    CAU: 'H',
    AAU: 'N',
    GAU: 'D',
    UAC: 'Y',
    CAC: 'H',
    AAC: 'N',
    GAC: 'D',
    UAA: 'Stop',
    CAA: 'Q',
    AAA: 'K',
    GAA: 'E',
    UAG: 'Stop',
    CAG: 'Q',
    AAG: 'K',
    GAG: 'E',
    UGU: 'C',
    CGU: 'R',
    AGU: 'S',
    GGU: 'G',
    UGC: 'C',
    CGC: 'R',
    AGC: 'S',
    GGC: 'G',
    UGA: 'Stop',
    CGA: 'R',
    AGA: 'R',
    GGA: 'G',
    UGG: 'W',
    CGG: 'R',
    AGG: 'R',
    GGG: 'G'
  }
  start_codon = 'AUG'
  codon_length = 3

  current_sequence = []
  sequences = []
  is_open = false
  rna.chars.each_slice(codon_length) do |sliced|
    codon = sliced.join
    next if codon.length < codon_length

    is_open ||= codon == start_codon
    next unless is_open

    amino_acid = codon_table[codon.to_sym]
    if amino_acid == 'Stop'
      sequences << current_sequence
      current_sequence = []
      is_open = false

      next
    end

    current_sequence << amino_acid
  end

  sequences.map(&:join).join '-'
end

results = rnas.map do |rna|
  (0..2).map { |start_index| translate_rna rna[start_index..] }.max_by { |amino_acids| amino_acids.count 'A-Z' }
end

# puts "ans"
results.each do |result|
  puts result
end
