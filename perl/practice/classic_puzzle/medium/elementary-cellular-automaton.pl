use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $r = <STDIN>);
chomp(my $n = <STDIN>);
chomp(my $start_pattern = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $RULE_LENGTH = 8;

my @reversed_binary_digits = split '', reverse(sprintf "%0${RULE_LENGTH}b", $r);

my %rule;
foreach my $i (0..($RULE_LENGTH - 1)) {
    $rule{sprintf '%03b', $i} = $reversed_binary_digits[$i];
}

my @results;
my $temp = $start_pattern;
$temp =~ tr/.@/01/;
foreach my $i (0..($n - 1)) {
    my $result = $temp;
    $result =~ tr/01/.@/;

    push @results, $result;

    my @array = (
        substr($temp, -1, 1),
        split('', $temp),
        substr($temp, 0, 1)
    );

    my $new_temp = '';
    foreach my $j (0..(length($temp) - 1)) {
        my $key = join '', @array[$j, $j+1, $j+2];
        $new_temp .= $rule{$key};
    }

    $temp = $new_temp;
}

# print ".....@.@.....\n";
foreach my $result (@results) {
    print "$result\n";
}

