use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @xs;
for my $i (0..$n-1) {
    chomp(my $x = <STDIN>);

    push @xs, $x;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $HAPPY_NUMBER = '1';
my $HAPPY_FACE = ':)';
my $UNHAPPY_FACE = ':(';

my @results;
foreach my $x (@xs) {
    my $temp = $x;

    my @exit_numbers = ($HAPPY_NUMBER);
    while (!grep { $_ == $temp } @exit_numbers) {
        push @exit_numbers, $temp;

        my $sum = 0;
        foreach my $d (split //, $temp) {
            $sum += $d ** 2;
        }

        $temp = $sum;
    }

    my $result_face = $temp == $HAPPY_NUMBER ? $HAPPY_FACE : $UNHAPPY_FACE;

    push @results, "$x $result_face";
}

# print "23 :)\n";
foreach my $result (@results) {
    print "$result\n";
}

