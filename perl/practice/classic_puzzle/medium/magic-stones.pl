use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::MoreUtils qw( uniq );
use POSIX 'floor';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
chomp($tokens=<STDIN>);
my @inputs = split(/ /,$tokens);
my @stones;
for my $level (@inputs) {
    push @stones, $level;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $stone_count = 0;
my @levels = sort { $a <=> $b } uniq @stones;

while (@levels) {
    my $level = shift @levels;
    my @target_level_stones = grep { $_ == $level } @stones;
    my $next_level_stone_count = floor(scalar(@target_level_stones) / 2);
    my $target_stone_count = scalar(@target_level_stones) % 2;

    @stones = grep { $_ != $level } @stones;

    if ($next_level_stone_count > 0) {
        my $next_level = $level + 1;
        for (my $i = 0; $i < $next_level_stone_count; $i++) {
            push @stones, $next_level;
        }
        unshift @levels, $next_level;
    }

    $stone_count += $target_stone_count;
}

# print "1\n";
print $stone_count;

