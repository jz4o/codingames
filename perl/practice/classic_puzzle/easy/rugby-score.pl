use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'min';
use POSIX 'floor';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $TRY_POINT = 5;
my $TRANSFORM_POINT = 2;
my $PENA_DROP_POINT = 3;

my @results;

my $possible_try_times = floor($n / $TRY_POINT);
for (my $try_times = $possible_try_times; $try_times >= 0; $try_times--) {
    my $try_points = $TRY_POINT * $try_times;

    my $possible_transformation_times = min(floor(($n - $try_points) / $TRANSFORM_POINT), $try_times);
    for (my $transformation_times = $possible_transformation_times; $transformation_times >= 0; $transformation_times--) {
        my $transform_points = $TRANSFORM_POINT * $transformation_times;

        my $remining_points = $n - $try_points - $transform_points;
        if ($remining_points % $PENA_DROP_POINT == 0) {
            my $penaltie_or_drop_times = $remining_points / $PENA_DROP_POINT;
            my $result = "$try_times $transformation_times $penaltie_or_drop_times";

            unshift @results, $result;
        }
    }
}

# print "tries transformations penalties\n";
for my $result (@results) {
    print "$result\n";
}

