use strict;
use warnings;
#use diagnostics;
use 5.32.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($w, $h, $count_x, $count_y) = split(/ /,$tokens);
chomp($tokens=<STDIN>);
my @inputs = split(/ /,$tokens);
my @width_measurements = (0);
for my $x (@inputs) {
    push @width_measurements, $x;
}
push @width_measurements, $w;
chomp($tokens=<STDIN>);
my @inputs2 = split(/ /,$tokens);
my @height_measurements = (0);
for my $y (@inputs2) {
    push @height_measurements, $y;
}
push @height_measurements, $h;

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my %width_counts = ();
my $width_measurements_size = @width_measurements;
foreach my $index (0..$width_measurements_size-1) {
    foreach my $i (0..$index-1) {
        my $width = $width_measurements[$index] - $width_measurements[$i];
        $width_counts{$width} = ($width_counts{$width} || 0) + 1
    }
}

my %height_counts = ();
my $height_measurements_size = @height_measurements;
foreach my $index (0..$height_measurements_size-1) {
    foreach my $i (0..$index-1) {
        my $height = $height_measurements[$index] - $height_measurements[$i];
        $height_counts{$height} = ($height_counts{$height} || 0) + 1;
    }
}

my $result = 0;
foreach my $k (keys %width_counts) {
    $result += $width_counts{$k} * ($height_counts{$k} || 0);
}

# print "0\n";
print "$result\n";
