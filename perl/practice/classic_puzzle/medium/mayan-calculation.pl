use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($l, $h) = split(/ /,$tokens);
my @ascii_mayans;
for my $i (0..$h-1) {
    chomp(my $numeral = <STDIN>);

    my @mayan_lines = $numeral =~ m/.{$l}/g;
    while (my ($i, $mayan) = each @mayan_lines) {
        $ascii_mayans[$i] .= $mayan;
    }
}
chomp(my $s1 = <STDIN>);
my $mayan1_str = '';
for my $i (0..$s1-1) {
    chomp(my $num_1line = <STDIN>);

    $mayan1_str .= $num_1line;
}
chomp(my $s2 = <STDIN>);
my $mayan2_str = '';
for my $i (0..$s2-1) {
    chomp(my $num_2line = <STDIN>);

    $mayan2_str .= $num_2line;
}
chomp(my $operation = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $MAYAN_BASE = 20;

my %mayan_2_integer;
while (my ($i, $mayan) = each @ascii_mayans) {
    $mayan_2_integer{$mayan} = $i;
}

my $mayan_length = $h * $l;

my @mayan1 = $mayan1_str =~ m/.{$mayan_length}/g;
my @mayan2 = $mayan2_str =~ m/.{$mayan_length}/g;
my @reversed_mayan1 = reverse @mayan1;
my @reversed_mayan2 = reverse @mayan2;

my $num1 = 0;
while (my ($i, $mayan) = each @reversed_mayan1) {
    $num1 += $mayan_2_integer{$mayan} * ($MAYAN_BASE ** $i);
}

my $num2 = 0;
while (my ($i, $mayan) = each @reversed_mayan2) {
    $num2 += $mayan_2_integer{$mayan} * ($MAYAN_BASE ** $i);
}

my $result_num = 0;
$result_num = $num1 + $num2 if $operation eq '+';
$result_num = $num1 - $num2 if $operation eq '-';
$result_num = $num1 * $num2 if $operation eq '*';
$result_num = $num1 / $num2 if $operation eq '/';

my $result_str = '';
do {
    $result_str = $ascii_mayans[$result_num % $MAYAN_BASE] . $result_str;
    $result_num = int($result_num / $MAYAN_BASE);
} while ($result_num > 0);

# print "result\n";
foreach my $result ($result_str =~ m/.{$l}/g) {
    print "$result\n";
}

