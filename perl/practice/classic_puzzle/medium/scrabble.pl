use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @words;
for my $i (0..$n-1) {
    chomp(my $w = <STDIN>);

    push @words, $w;
}
chomp(my $letters = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my %point_chars = (
    1 => 'eaionrtlsu',
    2 => 'dg',
    3 => 'dcmp',
    4 => 'fhvwy',
    5 => 'k',
    8 => 'jx',
    10 => 'qz'
);
my %points;
while (my ($point, $chars) = each %point_chars) {
    foreach my $w (split '', $chars) {
        $points{$w} = $point;
    }
}

my $best_word = '';
my $max_point = 0;
WORD_LOOP: foreach my $word (@words) {
    my $point = 0;
    my $can_chars = $letters;

    foreach my $w (split '', $word) {
        if ($can_chars !~ m/$w/) {
            next WORD_LOOP;
        }

        $point += $points{$w};

        $can_chars =~ s/$w//;
    }

    if ($max_point < $point) {
        $best_word = $word;
        $max_point = $point;
    }
}

# print "invalid word\n";
print "$best_word\n";

