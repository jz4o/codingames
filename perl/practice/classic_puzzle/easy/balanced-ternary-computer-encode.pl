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

my $BASE_NUM = 3;

my $based_num = convert_decimal_to_base(abs $n, $BASE_NUM);
my @based_digits = reverse split '', $based_num;

my @reverse_result;
while (my ($index, $digit) = each @based_digits) {
    push @reverse_result, 0 if scalar(@reverse_result) <= $index;
    $reverse_result[$index] += $digit;

    # carry up
    if ($BASE_NUM - 1 <= $reverse_result[$index]) {
        $reverse_result[$index] -= $BASE_NUM;

        push @reverse_result, 0 if scalar(@reverse_result <= $index + 1);
        $reverse_result[$index + 1] = 1;
    }
}

my $result = '';
foreach my $digit (reverse @reverse_result) {
    $digit *= -1 if $n < 0;
    $result .= ($digit < 0) ? 'T' : $digit;
}

# print "42\n";
print "$result";


sub convert_decimal_to_base {
    my ($decimal, $base) = @_;

    my @base_numbers = ('0'..'9', 'a'..'z');

    my $result = '';
    while ($decimal > 0) {
        my $mod = $base_numbers[$decimal % $base];
        $result = "$mod$result";

        $decimal = int($decimal / $base);
    }

    return $result || '0';
}

