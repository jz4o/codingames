use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use bigint;
use List::Util 'max', 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $m = <STDIN>);
chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $short_distance = min($m, $n) - 1;
my $long_distance = max($m, $n) - 1;

# one way city
if ($short_distance <= 0) {
    print "1";
    exit;
}

my $mole_combination = 1;
foreach my $i (($long_distance + 1)..($short_distance + $long_distance)) {
    $mole_combination *= $i;
}
my $deno_combination = 1;
foreach my $i (1..$short_distance) {
    $deno_combination *= $i;
}

my $movable_combination = $mole_combination / $deno_combination;
my $significant_digits = substr($movable_combination, 0, 1000);

# print "answer\n";
print "$significant_digits";

