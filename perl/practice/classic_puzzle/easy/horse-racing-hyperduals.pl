use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
my @strengths;
for my $i (0..$n-1) {
    chomp($tokens=<STDIN>);
    my ($v, $e) = split(/ /,$tokens);

    my %strength = (
        'v' => $v,
        'e' => $e
    );

    push @strengths, \%strength;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @results;
foreach my $l_index (0..($#strengths - 1)) {
    my %left = %{$strengths[$l_index]};

    foreach my $r_index (($l_index + 1)..$#strengths) {
        my %right = %{$strengths[$r_index]};

        my $result = abs($right{'v'} - $left{'v'}) + abs($right{'e'} - $left{'e'});
        push @results, $result;
    }
}

# print "42\n";
print min(@results);

