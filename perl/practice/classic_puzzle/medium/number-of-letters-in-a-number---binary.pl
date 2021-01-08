use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($start, $n) = split(/ /,$tokens);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $temp = $start;
foreach my $i (0..($n - 1)) {
    my $result = sprintf "%b", $temp;
    $result =~ s/0/zero/g;
    $result =~ s/1/one/g;
    $result = length $result;

    if ($temp == $result) {
        last;
    }

    $temp = $result;
}

# print "42\n";
print "$temp";

