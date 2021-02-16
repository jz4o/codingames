use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'max', 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($a, $b) = split(/ /,$tokens);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $high = max($a, $b);
my $low = min($a, $b);

my @results;

push @results, "$high * $low";

my $add_nums = '';
while ($low != 0) {
    if ($low % 2 == 0) {
        $high *= 2;
        $low = int($low / 2);
    } else {
        $add_nums .= " + $high";
        $low--;
    }

    push @results, "= $high * $low$add_nums";
}

my $answer = $a * $b;
push @results, "= $answer";

# print "answer\n";
foreach my $result (@results) {
    print "$result\n";
}

