use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>); # the number of relationships of influence
my %relation_map;
for my $i (0..$n-1) {
    # x: a relationship of influence between two people (x influences y)
    chomp($tokens=<STDIN>);
    my ($x, $y) = split(/ /,$tokens);

    $relation_map{$x} = () if !exists $relation_map{$x};

    push @{$relation_map{$x}}, $y;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

# The number of people involved in the longest succession of influences

my $deep_level = 0;
my @targets = keys %relation_map;
while (@targets) {
    $deep_level++;

    my @temp_targets = grep { exists $relation_map{$_} } @targets;
    @targets = ();
    foreach my $target (@temp_targets) {
        push @targets, @{$relation_map{$target}};
    }
}

# print "2\n";
print $deep_level;

