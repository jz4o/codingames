use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use POSIX 'floor';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @INITIAL_ARRAY = (1..$n);
my $CENTER_INDEX = floor($n / 2);
my @array = @INITIAL_ARRAY;
my @progress_log;

foreach my $i (0..$n-1) {
    my @front_half = @array[0..$CENTER_INDEX-1];
    my @back_half = @array[$CENTER_INDEX..$#array];

    my @result;
    @back_half = reverse @back_half;
    while (my ($index, $value) = each @back_half) {
        push @result, $value;

        if (scalar(@front_half) > $index) {
            push @result, $front_half[$index];
        }

        @array = @result
    }

    push @progress_log, join(',', @array);
}

# print "IMPOSSIBLE\n";
print "@array" eq "@INITIAL_ARRAY" ? join("\n", @progress_log) : 'IMPOSSIBLE';

