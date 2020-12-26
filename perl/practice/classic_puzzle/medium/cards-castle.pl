use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $h = <STDIN>);
my @grid;
for my $i (0..$h-1) {
    chomp(my $s = <STDIN>);

    my @row = split //, $s;

    push @grid, \@row;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $LEFT_PART = '/';
my $RIGHT_PART = '\\';
my $PART_EMPTY =  '.';

my $is_stable = 1;
CHECK: foreach my $height (0..($h - 1)) {
    my $is_bottom_row = $height == $h - 1;

    foreach my $width (0..($h * 2 - 1)) {
        my $card = @{$grid[$height]}[$width];

        if ($card ne $PART_EMPTY) {
            my $is_right_part = $card eq $RIGHT_PART;
            my $side_card = $is_right_part ? @{$grid[$height]}[$width - 1] : @{$grid[$height]}[$width + 1];
            my $partner_part = $is_right_part ? $LEFT_PART : $RIGHT_PART;

            my $check_side_card = $side_card eq $partner_part;
            my $check_under_card = $is_bottom_row || @{$grid[$height + 1]}[$width] eq $partner_part;

            if (!$check_side_card || !$check_under_card) {
                $is_stable = 0;
                last CHECK;
            }
        }
    }
}

# print "UNSTABLE\n";
print $is_stable ? 'STABLE' : 'UNSTABLE';

