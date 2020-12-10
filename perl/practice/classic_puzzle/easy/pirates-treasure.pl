use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $w = <STDIN>);
chomp(my $h = <STDIN>);
my @map;
my @map_line;
for my $i (0..$w+1) {
    push @map_line, 1;
}
push @map, \@map_line;
for my $i (0..$h-1) {
    chomp($tokens=<STDIN>);
    my @inputs = split(/ /,$tokens);
    my @line;
    push @line, 1;
    for my $v (@inputs) {
        push @line, $v;
    }
    push @line, 1;

    push @map, \@line;
}
push @map, \@map_line;

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $result;
search: for my $height (1..$h) {
    for my $width (1..$w) {
        if (@{$map[$height]}[$width] != 0) {
            next;
        }

        my @around_masses = (
            @{$map[$height - 1]}[$width - 1],
            @{$map[$height - 1]}[$width],
            @{$map[$height - 1]}[$width + 1],
            @{$map[$height]}[$width - 1],
            @{$map[$height]}[$width + 1],
            @{$map[$height + 1]}[$width - 1],
            @{$map[$height + 1]}[$width],
            @{$map[$height + 1]}[$width + 1],
        );
        if (grep { $_ == 0 } @around_masses) {
            next;
        }

        my $width_index = $width - 1;
        my $height_index = $height - 1;
        $result = "$width_index $height_index";

        last search;
    }
}

# print "x y\n";
print "$result";

