use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $alignment = <STDIN>);
chomp(my $n = <STDIN>);
my @texts;
for my $i (0..$n-1) {
    chomp(my $text = <STDIN>);

    push @texts, $text;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $width = 0;
foreach my $i (@texts) {
    my $length = length $i;
    if ($length > $width) {
        $width = $length;
    }
}

my @results;
if ($alignment eq 'LEFT') {
    push @results, @texts;
} elsif ($alignment eq 'RIGHT') {
    foreach my $text (@texts) {
        my $space = ' ' x ($width - length($text));

        push @results, "$space$text";
    }
} elsif ($alignment eq 'CENTER') {
    foreach my $text (@texts){
        my $space = ' ' x int(($width - length($text) + 1) / 2);

        push @results, "$space$text"
    }
} elsif ($alignment eq 'JUSTIFY') {
    foreach my $text (@texts) {
        my $result = justify_text($text, $width);

        push @results, $result;
    }
}

# print "answer\n";
foreach my $result (@results) {
    print "$result\n";
}

sub justify_text {
    my ($text, $width) = @_;

    if (length($text) == $width) {
        return $text;
    }

    my @words = split ' ', $text;
    my $space_size = $width - length(join '', @words);
    my $each_space_size = int($space_size / (scalar(@words) - 1));
    my @space_sizes;
    foreach my $i (1..(scalar(@words) - 1)) {
        my $size = int($each_space_size * $i) - int($each_space_size * ($i - 1));

        push @space_sizes, $size;
    }

    my $result;
    while (my ($index, $word) = each @words) {
        my $space = $index < scalar(@space_sizes) ? ' ' x int($space_sizes[$index]) : '';

        $result .= "$word$space";
    }

    return $result;
}

