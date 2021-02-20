use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($n1, $n2) = split(/ /,$tokens);
chomp(my $s1 = <STDIN>);
chomp(my $s2 = <STDIN>);
chomp(my $t = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @s1_move_part = reverse(split '', substr($s1, 0, $t));
my @s2_move_part = split '', substr($s2, 0, $t);

while (scalar(@s1_move_part) < $t) {
    unshift @s1_move_part, '';
}
while (scalar @s2_move_part < $t) {
    push @s2_move_part, '';
}

my $s_moved_part = '';
foreach my $i (0..($t - 1)) {
    $s_moved_part .= $s2_move_part[$i];
    $s_moved_part .= $s1_move_part[$i];
}

my $s1_not_move_part = join '', reverse(split '', (length($s1) < $t ? '' : substr($s1, $t)));
my $s2_not_move_part = length($s2) < $t ? '' : substr($s2, $t);

# print "answer\n";
print $s1_not_move_part . $s_moved_part . $s2_not_move_part;

