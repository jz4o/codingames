use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $m = <STDIN>);
chomp(my $n = <STDIN>);
my @grid;
my @grid_row;
foreach my $i (1..$n+1) {
    push @grid_row, 1;
}
push @grid, \@grid_row;
for my $i (0..$m-1) {
    chomp(my $row = <STDIN>);

    my @grid_row;

    push @grid_row, 1;
    push @grid_row, split('', $row);

    push @grid, \@grid_row;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @path_grid;
foreach my $i (1..$m+1) {
    my @path_grid_row;
    foreach my $j (1..$n+1) {
        push @path_grid_row, 0;
    }
    push @path_grid, \@path_grid_row;
}

@{$grid[1]}[1] = 1;
@{$path_grid[1]}[1] = 1;

foreach my $row (1..$m) {
    foreach my $column (1..$n) {
        if (@{$grid[$row]}[$column] != 0) {
            next;
        }

        my $top_mass_paths = @{$path_grid[$row - 1]}[$column];
        my $left_mass_paths = @{$path_grid[$row]}[$column - 1];
        @{$path_grid[$row]}[$column] = $top_mass_paths + $left_mass_paths;
    }
}

# print "answer\n";
print @{$path_grid[$m]}[$n];

