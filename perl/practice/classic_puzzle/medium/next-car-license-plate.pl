use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $x = <STDIN>);
chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my ($ab, $cde, $fg) = split '-', $x;

my $alpha = $ab . $fg;
my $alpha_int = alpha_to_int($alpha);
$cde += $n - 1;

my $carry = int($cde / 999);
$cde = $cde % 999;
$alpha_int += $carry;
$alpha = int_to_alpha($alpha_int);

$ab = substr $alpha, 0, 2;
$cde = sprintf '%03d', $cde + 1;
$fg = substr $alpha, -2;

# print "AA-000-AA\n";
my $result = "$ab-$cde-$fg";
print "$result\n";

sub alpha_to_int {
    my ($alpha) = @_;

    my @ALPHABETS = 'A'..'Z';

    my $result = 0;

    my @reverse_alpha_chars = reverse split '', $alpha;
    while (my ($index, $char) = each @reverse_alpha_chars) {
        my ($alpha_index) = grep { $ALPHABETS[$_] eq $char } 0..$#ALPHABETS;
        $alpha_index++;

        $result += (scalar(@ALPHABETS) ** $index) * $alpha_index;
    }

    return $result;
}

sub int_to_alpha {
    my ($alpha_int) = @_;

    my @ALPHABETS = 'A'..'Z';

    my $result = '';
    while ($alpha_int > 0) {
        my $i = $alpha_int % scalar(@ALPHABETS);
        if ($i == 0) {
            $i = scalar(@ALPHABETS);
            $alpha_int--;
        }

        $alpha_int = $alpha_int > scalar(@ALPHABETS) ? int($alpha_int / scalar(@ALPHABETS)) : 0;

        $result = $ALPHABETS[$i - 1] . $result;
    }

    return $result;
}

