use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($w, $h) = split(/ /,$tokens);
chomp($tokens=<STDIN>);
my ($x, $y) = split(/ /,$tokens);
my @grid;
my @wall_row = split '', (' ' x ($w + 2));
push @grid, \@wall_row;
for my $i (0..$h-1) {
    chomp(my $r = <STDIN>);

    my @row = (' ', split('', $r), ' ');
    push @grid, \@row;
}
push @grid, \@wall_row;

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @checked_masses;
my @be_check_masses;
my @exit_masses;

push @be_check_masses, ($y + 1) . ' ' . ($x + 1);
while (scalar(@be_check_masses) > 0) {
    my $check_mass = pop @be_check_masses;
    my ($mass_y, $mass_x) = split ' ', $check_mass;

    next if grep { $_ eq $check_mass } @checked_masses;

    push @checked_masses, $check_mass;

    my @near_masses = (
        $mass_y . ' ' . ($mass_x - 1),
        ($mass_y - 1) . ' ' . $mass_x,
        $mass_y . ' ' . ($mass_x + 1),
        ($mass_y + 1) . ' ' . $mass_x
    );

    foreach my $near_mass (@near_masses) {
        my ($ny, $nx) = split ' ', $near_mass;
        my $mass = $grid[$ny][$nx];

        if ($mass eq ' ') {
            push @exit_masses, ($mass_x - 1) . ' ' . ($mass_y - 1);
        } elsif ($mass eq '.') {
            push @be_check_masses, "$ny $nx";
        }
    }
}

@exit_masses = sort {
    my ($a_y, $a_x) = split ' ', $a;
    my ($b_y, $b_x) = split ' ', $b;

    $a_y <=> $b_y or $a_x <=> $b_x
} @exit_masses;

# print "answer\n";
print scalar(@exit_masses) . "\n";
foreach my $exit_mass (@exit_masses) {
    print "$exit_mass\n";
}

