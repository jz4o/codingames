use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @digits = (0, split //, $n);

my @reverse_digits = reverse @digits;
my ($decrement_index) = grep { $reverse_digits[$_] != 0 } 0..$#reverse_digits;
$decrement_index = $#reverse_digits - $decrement_index;
$digits[$decrement_index]--;

my @increment_targets = @digits[0..($decrement_index - 1)];
my @reverse_increment_targets = reverse @increment_targets;
my ($increment_index) = grep { $reverse_increment_targets[$_] != 9 } 0..$#reverse_increment_targets;
$increment_index = $#reverse_increment_targets - $increment_index;
$digits[$increment_index]++;

my @sort_targets = sort { $a <=> $b } @digits[($increment_index + 1)..$#digits];

my @result_array = (@digits[0..$increment_index], @sort_targets);
my $result = join '', @result_array;
$result =~ s/^0+//;

# print "11\n";
print "$result";

