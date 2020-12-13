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
chomp(my $n = <STDIN>);
my @grid;
for my $i (0..$h-1) {
    chomp(my $line = <STDIN>);

    my @line_masses = split //, $line;
    push @grid, \@line_masses;
}

my @directions = ('N', 'E', 'S', 'W');
my $direction_index = 0;

my $y_index = 0;
my $x_index = 0;
while (my ($index, $line) = each @grid) {
    my @line_array = @{$line};
    if (grep { $_ eq 'O' } @line_array) {
        $y_index = $index;
        ($x_index) = grep { $line_array[$_] eq 'O' } 0 .. $#line_array;
    }
}

my $initial_y = $y_index;
my $initial_x = $x_index;

my $turn = 0;
my @logs;
while ($turn < $n) {
    push @logs, "$x_index $y_index $direction_index";

    $turn++;

    my $direction = $directions[$direction_index];

    # forward
    if ($direction eq 'N') {
        $y_index--;
    } elsif ($direction eq 'E') {
        $x_index++;
    } elsif ($direction eq 'W') {
        $x_index--;
    } elsif ($direction eq 'S') {
        $y_index++;
    }

    # get ahead mass
    my $ahead_mass;
    if ($direction eq 'N' && $y_index > 0) {
        $ahead_mass = @{$grid[$y_index - 1]}[$x_index];
    } elsif ($direction eq 'E' && $y_index < $w - 1) {
        $ahead_mass = @{$grid[$y_index]}[$x_index + 1];
    } elsif ($direction eq 'W' && $x_index > 0) {
        $ahead_mass = @{$grid[$y_index]}[$x_index - 1];
    } elsif ($direction eq 'S' && $y_index < $h - 1) {
        $ahead_mass = @{$grid[$y_index + 1]}[$x_index];
    }

    # turn right if obstacle in ahead mass
    while ($ahead_mass eq '#') {
        $direction_index = ($direction_index + 1) % scalar(@directions);
        $direction = $directions[$direction_index];

        if ($direction eq 'N' && $y_index > 0) {
            $ahead_mass = @{$grid[$y_index - 1]}[$x_index];
        } elsif ($direction eq 'E' && $y_index < $w - 1) {
            $ahead_mass = @{$grid[$y_index]}[$x_index + 1];
        } elsif ($direction eq 'W' && $x_index > 0) {
            $ahead_mass = @{$grid[$y_index]}[$x_index - 1];
        } elsif ($direction eq 'S' && $y_index < $h - 1) {
            $ahead_mass = @{$grid[$y_index + 1]}[$x_index];
        }
    }

    # omit to loop turn
    my $log = "$x_index $y_index $direction_index";
    if (grep {$_ eq $log} @logs) {
        my ($same_log_index) = grep { $logs[$_] eq $log } 0 .. $#logs;
        my $loop_size = $turn - $same_log_index;

        $turn = $n - (($n - $same_log_index) % $loop_size)
    }
}

print "$x_index $y_index";

