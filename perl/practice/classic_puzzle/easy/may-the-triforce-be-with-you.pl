use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $WIDTH = $n * 4 - 1;

my $upper_part = '';
my $lower_part = '';
for (my $i = 1; $i <= $n; $i++) {
    my $part = '*' x ($i * 2 - 1);

    my $upper_left_space_part = ' ' x (($WIDTH - length $part) / 2);
    $upper_part .= "$upper_left_space_part$part\n";

    my $lower_space_part = ' ' x (($n - $i + 1) * 2 - 1);
    my $lower_line = "$part$lower_space_part$part";
    my $lower_left_space_part = ' ' x (($WIDTH - length $lower_line) / 2);
    $lower_part .= "$lower_left_space_part$lower_line\n";
}

$upper_part =~ s/^./\./;
my $result = "$upper_part$lower_part";

# print "answer\n";
print "$result";

