use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $lhs = <STDIN>);
chomp(my $op = <STDIN>);
chomp(my $rhs = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $decimal_lhs = balance_to_decimal($lhs);
my $decimal_rhs = balance_to_decimal($rhs);
$decimal_rhs = 3 ** $decimal_rhs if $op eq '<<' || $op eq '>>';

my $decimal_result = 0;
if ($op eq '+') {
    $decimal_result = $decimal_lhs + $decimal_rhs;
} elsif ($op eq '-') {
    $decimal_result = $decimal_lhs - $decimal_rhs;
} elsif ($op eq '*' || $op eq '<<') {
    $decimal_result = $decimal_lhs * $decimal_rhs;
} elsif ($op eq '>>') {
    $decimal_result = $decimal_lhs / $decimal_rhs;
}

# print "11T\n";
print decimal_to_balance($decimal_result);

sub balance_to_decimal {
    my ($balance) = @_;

    my @chars = reverse split '', $balance;

    my $result = 0;
    while (my ($index, $char) = each @chars) {
        my $c = $char eq 'T' ? -1 : $char;
        $result += $c * (3 ** $index);
    }

    return $result;
}

sub decimal_to_balance {
    my ($decimal) = @_;

    my $result = '';
    while ($decimal != 0) {
        my $mod = $decimal % 3;
        $decimal = int($decimal / 3);

        if ($mod == 2) {
            $decimal++;
            $result = "T$result";
        } else {
            $result = "$mod$result";
        }
    }

    return $result;
}

