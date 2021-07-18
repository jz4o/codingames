use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use Math::BigInt;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
chomp($tokens=<STDIN>);
my @inputs = split(/ /,$tokens);
my @results;
for my $label (@inputs) {
    if ($label =~ /^\d+$/) {
        push @results, int_label_to_alpha_label($label);
    } else {
        push @results, alpha_label_to_int_label($label);
    }
}
print join ' ', @results;

sub int_label_to_alpha_label {
    my ($int_label) = @_;
    $int_label = Math::BigInt->new("$int_label");

    my @ALPHAS = ('A'..'Z');

    my $result = '';
    while ($int_label > 0) {
        my $i = $int_label % scalar(@ALPHAS);
        $int_label = int($int_label / scalar(@ALPHAS));
        $int_label-- if $i == 0;

        $result = "$ALPHAS[$i - 1]$result";
    }

    return $result;
}

sub alpha_label_to_int_label {
    my ($alpha_label) = @_;

    my @ALPHAS = ('A'..'Z');

    my $result = 0;

    my @chars = split '', $alpha_label;
    my $chars_length = scalar @chars;
    foreach my $i (0..($chars_length - 1)) {
        my $base_number = Math::BigInt->new(scalar(@ALPHAS)) ** $i;
        my ($alpha_index) = grep { $ALPHAS[$_] eq $chars[$chars_length - 1 - $i] } 0..$#ALPHAS;
        $alpha_index = -1 unless defined $alpha_index;
        $alpha_index++;

        $result += $base_number * $alpha_index;
    }

    return $result;
}

