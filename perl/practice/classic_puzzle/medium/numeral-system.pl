use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $equality = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @NUMERALS = split '', '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

my ($x, $y, $z) = split /[+=]/, $equality;

my $max_numeral_index = -1;
while (my ($index, $c) = each @NUMERALS) {
    if ($equality =~ m/$c/) {
        $max_numeral_index = $index;
    }
}
$max_numeral_index++;

my $result = -1;
foreach my $i ($max_numeral_index..scalar(@NUMERALS)) {
    my $numeral_x = to_decimal($x, $i);
    my $numeral_y = to_decimal($y, $i);
    my $numeral_z = to_decimal($z, $i);

    if ($numeral_x + $numeral_y == $numeral_z) {
        $result = $i;
        last;
    }
}

# print "answer\n";
print "$result\n";

sub to_decimal {
    my ($num, $base) = @_;

    my $NUMERAL_STRING = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    my @reverse_digits = reverse split '', $num;

    my $decimal = 0;
    while (my ($base_index, $digit) = each @reverse_digits) {
        $decimal += ($base ** $base_index) * (index $NUMERAL_STRING, $digit);
    }

    return $decimal;
}

