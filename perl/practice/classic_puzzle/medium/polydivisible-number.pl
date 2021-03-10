use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use Math::BigInt;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $number = <STDIN>);
my @numbers = map { int $_ } split ' ', $number;
my $nbanswer = 36;
for my $base (0..$nbanswer-1) {

    # Write an answer using print
    # To debug: print STDERR "Debug messages...\n";

    my $next_flag;
    foreach my $i (@numbers) {
        if ($base <= $i) {
            $next_flag = 1;
            last;
        }
    }
    next if $next_flag;

    my $base_number = '';
    foreach my $i (@numbers) {
        $base_number .= decimal_to_base($i, $base);
    }

    my $decimal_number = base_to_decimal($base_number, $base);

    foreach my $i (1..length("$decimal_number")) {
        my $decimal = Math::BigInt->new(substr "$decimal_number", 0, $i);
        if ($decimal % $i != 0) {
            $next_flag = 1;
            last;
        }
    }
    next if $next_flag;

    # print "value\n";
    print "$base\n";
}

sub decimal_to_base {
    my ($num, $base) = @_;

    my @digits = (0..9, 'a'..'z');

    my $result = '';
    while ($num > 0) {
        my $mod = $digits[$num % $base];
        $result = "$mod$result";

        $num = int($num / $base);
    }
    $result = '0' unless $result;

    return $result;
}

sub base_to_decimal {
    my ($base_num, $base) = @_;

    my @digits = (0..9, 'a'..'z');

    my $result = 0;

    my @reversed_digits = reverse split '', $base_num;
    while (my ($index, $digit) = each (@reversed_digits)) {
        my ($decimal_digit) = grep { $digits[$_] eq $digit } 0..$#digits;
        my $digit_base = Math::BigInt->new("$base") ** $index;

        $result += $digit_base * $decimal_digit;
    }

    return $result;
}

