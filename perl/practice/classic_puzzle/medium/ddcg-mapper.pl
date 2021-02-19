use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $l = <STDIN>);
chomp(my $n = <STDIN>);
my @patterns;
my @tempos;
for my $i (0..$n-1) {
    chomp($tokens=<STDIN>);
    my ($pattern, $tempo) = split(/ /,$tokens);

    $pattern =~ s/X/1/g;

    push @patterns, oct('0b' . $pattern);
    push @tempos, $tempo;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @results;
foreach my $i (1..$l) {
    my $result_number = 0;
    foreach my $index (0..$#tempos) {
        $result_number |= $patterns[$index] if $i % $tempos[$index] == 0;
    }

    my $result = sprintf('%04b', $result_number);
    $result =~ s/1/X/g;

    unshift @results, $result;
}

# print "answer\n";
foreach my $result (@results) {
    print "$result\n";
}

