use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @xys;
for my $i (0..$n-1) {
    chomp(my $x_y = <STDIN>);

    push @xys, $x_y;
}
for my $i (0..$n-1) {

    # Write an answer using print
    # To debug: print STDERR "Debug messages...\n";

    my $xy = $xys[$i];
    my ($x, $y) = split '/', $xy;

    if ($y == 0) {
        print "DIVISION BY ZERO\n";
        next;
    }

    my $int = int($x / $y);
    my $int_str = $int != 0 ? $int : '';

    my $rat = int(abs($x) % abs($y));
    my $gcd_number = gcd($rat, $y);
    my $rat_x = abs(int($rat / $gcd_number));
    my $rat_y = abs(int($y / $gcd_number));

    my @minus_elements = grep { $_ =~ m/^\-/ } ($int, $x, $y);
    my $minus = scalar(@minus_elements) % 2 == 1 ? '-' : '';
    my $rat_str = $rat != 0 ? "$minus$rat_x/$rat_y" : '';

    my $result = "$int_str $rat_str";
    $result =~ s/^\s+|\s+$//g;

    # print "answer\n";
    print(length($result) != 0 ? "$result\n" : "0\n");
}

sub gcd {
    my ($x, $y) = @_;

    while ($x % $y != 0) {
        ($x, $y) = ($y, $x % $y);
    }

    return $y;
}

