use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $size = <STDIN>);
chomp(my $n = <STDIN>);
my @names;
for my $i (0..$n-1) {
    chomp(my $name = <STDIN>);

    push @names, $name;
}
chomp(my $t = <STDIN>);
my @throw_datas;
for my $i (0..$t-1) {
    chomp($tokens=<STDIN>);
    my ($throw_name, $throw_x, $throw_y) = split(/ /,$tokens);

    my %throw_data = (
        'name' => $throw_name,
        'x' => $throw_x,
        'y' => $throw_y
    );
    push @throw_datas, \%throw_data;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $HALF_SIZE = int($size / 2);
my %score_board;
foreach my $name (@names) {
    $score_board{$name} = 0;
}

foreach my $scalar_throw_data (@throw_datas) {
    my %throw_data = %{$scalar_throw_data};
    my $name = $throw_data{'name'};
    my $x = $throw_data{'x'};
    my $y = $throw_data{'y'};

    my $distance_with_center = sqrt($x ** 2 + $y ** 2);
    my $distance_with_edge = sqrt(($HALF_SIZE - abs($x)) ** 2 + ($HALF_SIZE - abs($y)) ** 2);

    my $in_square_horizontal = $HALF_SIZE * -1 <= $x && $x <= $HALF_SIZE;
    my $in_square_vertical = $HALF_SIZE * -1 <= $y && $y <= $HALF_SIZE;

    my $in_square = $in_square_horizontal && $in_square_vertical;
    my $in_circle = $distance_with_center <= $HALF_SIZE;
    my $in_diamond = $distance_with_center <= $distance_with_edge;

    my $score = 0;
    if ($in_diamond) {
        $score = 15;
    } elsif ($in_circle) {
        $score = 10;
    } elsif ($in_square) {
        $score = 5;
    }

    $score_board{$name} += $score;
}

my @sorted_score_names = sort {
    my $a_score = $score_board{$a};
    my $b_score = $score_board{$b};
    my ($a_name_index) = grep { $names[$_] eq $a } 0..$#names;
    my ($b_name_index) = grep { $names[$_] eq $b } 0..$#names;

    $b_score <=> $a_score
    or $a_name_index <=> $b_name_index
} keys %score_board;

# print "answer\n";
foreach my $name (@sorted_score_names) {
    my $score = $score_board{$name};
    print "$name $score\n";
}

