use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
chomp(my $y = <STDIN>);
my @cages;
for my $i (0..$n-1) {
    chomp($tokens=<STDIN>);
    my ($s, $h, $a) = split(/ /,$tokens);

    my %cage = (
        'sick' => $s,
        'healthy' => $h,
        'alive' => $a
    );

    push @cages, \%cage;
}
for my $i (0..$y-1) {

    # Write an answer using print
    # To debug: print STDERR "Debug messages...\n";

    my $alive_count = 0;
    foreach my $c (0..(scalar(@cages) - 1)) {
        my $sick_count = $cages[$c]{'sick'} * (2 ** $i);
        $cages[$c]{'alive'} -= min($sick_count, $cages[$c]{'alive'});

        $alive_count += $cages[$c]{'alive'};
    }

    print "$alive_count\n";

    if ($alive_count <= 0) {
        last;
    }

    # print "answer\n";
}

