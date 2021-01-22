use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $x = <STDIN>);
chomp(my $y = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @x_chars = split '', $x;
my @y_chars = split '', $y;
my $replace_targets = '';
my $replaced_chars = '';
foreach my $i (0..(scalar(@x_chars) - 1)) {
    if ($x_chars[$i] ne $y_chars[$i] && (index $replace_targets, $x_chars[$i]) == -1) {
        $replace_targets .= $x_chars[$i];
        $replaced_chars .= $y_chars[$i];
    }
}

my $result = $x;
eval "\$result =~ tr/$replace_targets/$replaced_chars/";

# print "anwser\n";
if ($x eq $y) {
    print 'NONE';
} elsif ($result eq $y) {
    foreach my $i (0..(length($replace_targets) - 1)) {
        print ((substr $replace_targets, $i, 1) . '->' . (substr $replaced_chars, $i, 1) . "\n");
    }
} else {
    print "CAN'T";
}

