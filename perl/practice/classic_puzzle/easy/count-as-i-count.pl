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

my $TARGET_SCORE = 50;
my $POSSIBLE_ROUNDS = 4;
my @POINT_NUMBERS = (1, (2..12), (2..12));

my $result = 0;
my %patterns;

my @numbers = ($n);
my %pattern = ('numbers' => \@numbers, 'count' => 1, 'score' => $n);
$patterns{$n} = \%pattern;

while (scalar(%patterns) > 0) {
    my @pattern_keys = keys %patterns;
    my $key = shift @pattern_keys;
    my %pattern = %{$patterns{$key}};

    delete $patterns{$key};

    foreach my $point_number (@POINT_NUMBERS) {
        my @new_number_list = sort(@{$pattern{'numbers'}}, $point_number);
        my $new_numbers = join ' ', @new_number_list;

        if (exists $patterns{$new_numbers}) {
            $patterns{$new_numbers}{'count'} += $pattern{'count'};
        } else {
            my %new_pattern = ('numbers' => \@new_number_list, 'count' => $pattern{'count'}, 'score' => $pattern{'score'} + $point_number);
            $patterns{$new_numbers} = \%new_pattern;
        }
    }

    foreach my $k (keys %patterns) {
        my %v = %{$patterns{$k}};

        if ($v{'score'} > $TARGET_SCORE || scalar(@{$v{'numbers'}}) > $POSSIBLE_ROUNDS + 1) {
            delete $patterns{$k};
        } elsif ($v{'score'} == $TARGET_SCORE) {
            $result += $v{'count'};
            delete $patterns{$k};
        }
    }
}

# print "answer\n";
print "$result";

